---
    sidebar_position: 13
---

# BonusEventUI

![Ejemplo ](../../../../../static/juego-img/interfaz/interfaces/game/BonusEventUI.png)

## Descripción

**BonusEventUI** es la interfaz encargada de mostrar los eventos relacionados con las cartas de tipo **Bonus**. Estructuralmente, cuenta con múltiples contenedores dinámicos que muestran diferentes elementos e información según lo requiera el evento. Esto incluye un contenedor de información, un listado de opciones, un péndulo y un control de modificador, todos diseñados para facilitar la interacción del jugador con el evento y proporcionar una experiencia dinámica según el juego lo necesite.

---

## Controlador: Modo Normal

Durante el modo normal, **BonusEventUI** se dispara bajo dos condiciones completamente diferentes, lo que provoca que su lógica varíe considerablemente. Este evento aplica sus modificadores después de salir de **EventsUI**. Las dos condiciones en las que este controlador y evento entran en acción son:

- Cuando la carta de evento **Bonus** es activada desde **EventsUI**.
- Cuando se está a punto de finalizar el turno, después de que se hayan dado los puntajes desde **MasterUI**.

Dependiendo del caso, el flujo de ejecución varía, así como el tipo de dato que se recibe desde los atributos.

```csharp
namespace UI.Controllers.Views.Normal
{
    public class BonusEventUI : Core.UI
    {
        private GameObject _object;

        //Elementos UI
        private VisualElement _containerMain; // contenedor Principal
        private VisualElement _containerChoose; // Contenedor de opciones
        private VisualElement _containerInfo; // Contenedor de Informacion
        private PendulumComponent _pendulum; // Contenedor Pendulo
        private VisualElement _containerModifier; // Contenedor modificador
        private VisualElement _containerBtnNext; // contenedor del boton Next
        private List<Button> _electionList; // Lista Eleccion

        private Button _btnNext;

        //Auxiliar
        private BonusCardAttributes _attributes; // contexto local
        private TypeConcept _currentTypeConcept; // tipo de concepto a manejar por el evento actual
        private string _selectedConcept; // concepto a mostrar por el evento actual




        //----------FLUJO EJECUCION-----------
        public BonusEventUI()

        {
            GameEventBus<BonusCardAttributes>.Subscribe("BonusCard", InitModifier);
            GameEventBus<NormalModeAttributes.NormalModeInitGameAttributes>.Subscribe("BonusCard_E_B_1", BonusCard_E_B_1);
            GameEventBus<NormalModeAttributes.NormalModeInitGameAttributes>.Subscribe("BonusCard_E_B_2", BonusCard_E_B_2);
            GameEventBus<NormalModeAttributes.NormalModeInitGameAttributes>.Subscribe("BonusCard_E_B_3", BonusCard_E_B_3);
            GameEventBus<NormalModeAttributes.NormalModeInitGameAttributes>.Subscribe("BonusCard_E_B_4", BonusCard_E_B_4);
            GameEventBus<NormalModeAttributes.NormalModeInitGameAttributes>.Subscribe("BonusCard_E_B_5", BonusCard_E_B_5);
            Debug.Log("CONSTRUYENDO: BonusEventUI");
        }

        public override void InitInstance(GameObject ui)
        {
            _object = ui;
        }
        //Más Metodos...
    }
}
```

---

### Flujo de ejecución

**Flujo "Modificador"**

![Ejemplo ](../../../../../static/juego-img/interfaz/interfaces/game/BonusEventUI2.png)

Durante el flujo de **Modificador**, **BonusEventUI** actúa como un componente, similar a **TimeEventUI**, y no activa una interfaz completa. En su lugar, manipula directamente el elemento UI **modificador** de la carta que fue activada desde **EventsUI**. 

Una vez que el evento se ha completado, se envía una señal de **OnComplete** para que **EventsUI** pueda continuar con su lógica. Esta circunstancia se dispara por una suscripción especial llamada **BonusCard**, la cual activa específicamente un inicializador especial diseñado exclusivamente para la modificación del modificador: **InitModifier**.

```csharp
GameEventBus<BonusCardAttributes>.Subscribe("BonusCard", InitModifier);

public void InitModifier(object attributes)
{
    Debug.Log("INIT!");

    if (attributes.GetType() != typeof(BonusCardAttributes))
    {
        Debug.LogError("TIPO DE DATO DIFERENTE A NORMALMODE");
        return;
    }
    BonusCardAttributes initGameAttributes = attributes as BonusCardAttributes;
    _attributes = initGameAttributes;

    //Manejo del componente
}
```

En este momento, los datos de contexto son recibidos directamente, igual que en cualquier otro evento, pero con su tipo particular: **BonusCardAttributes**. Esto permite que el modificador se aplique adecuadamente según los atributos específicos de la carta **Bonus** activada.

---

**Flujo Activación**

Durante el flujo de activación, se activa la interfaz en sí. El flujo de ejecución varía dependiendo de la carta de evento en cuestión, pero todos los flujos pasan por **Init** al comenzar. Esto se debe a que **Init** se encarga de entregar el contexto de la partida a la interfaz y se asegura de que el objeto se active llamando a **OpenModal** para la inicialización automática y la búsqueda de las referencias UI de la interfaz una vez que el evento es disparado.

Es importante destacar que, en las suscripciones, **Init** en vez de recibir un **BonusCardAttributes**, recibe un **NormalModeAttributes**. Esto se debe a que, a estas alturas, técnicamente ya se está fuera de la fase de eventos. Sin embargo, esto NO quiere decir que no se entreguen los datos necesarios, ya que, en realidad, lo que se entrega es un **BonusCardAttributes** envuelto en un **NormalModeAttributes**. Esta estructura asegura que la lógica y los datos del evento se manejen adecuadamente durante el flujo del juego.

```csharp
public override void Init(object attributes)
{
    if (attributes.GetType() != typeof(NormalModeAttributes.NormalModeInitGameAttributes))
    {
        Debug.LogError("TIPO DE DATO DIFERENTE A NORMALMODE");
        return;
    }
    NormalModeAttributes.NormalModeInitGameAttributes initGameAttributes = attributes as NormalModeAttributes.NormalModeInitGameAttributes; //Envoltorio
    _attributes = initGameAttributes.bonusCardAttributes; // Recepción de datos

    GameEventBus<NormalMode>.Instance.uiManager.modalManager.OpenModal<string>(typeof(BonusEventUI)); // Apertura Automatica

}
```

Igualmente, la lógica de cada evento está separada individualmente por el ID de cada **BonusCard**, lo que permite que cada carta tenga su propia acción y flujo de ejecución. Al final de cada flujo, se cierra el modal y se pasa al siguiente **ListEvent**, permitiendo que el flujo del juego continúe.

```csharp
 //----------LOGICA EVENTOS-----------
private void BonusCard_E_B_1(object attributes)
{
    Init(attributes); //Inicializa Init

    //Sigue flujo del evento...
}

private void BonusCard_E_B_2(object attributes)
{
    Init(attributes); //Inicializa Init

    //Sigue flujo del evento...
    
}
private void BonusCard_E_B_3(object attributes)
{
    Init(attributes); //Inicializa Init

    //Sigue flujo del evento...
}

private void BonusCard_E_B_4(object attributes)
{
    Init(attributes); //Inicializa Init

    //Sigue flujo del evento...
}

private void BonusCard_E_B_5(object attributes)
{
    Init(attributes); //Inicializa Init

    //Sigue flujo del evento...
}
```

---

### Commands

Esta interfaz cuenta con los siguientes comandos únicos de **AnimatorCommand**: 
- **ManageModifierCommand**: Usado al activar el evento de EventsUI, aplica las animaciones para hacer al modificador aparecer al lado derecho de la carta.
- **ShowElements**: Usado para transiciones entre fases del evento, para animar la entrada y salida de contenedores y elementos dinamicamente.
