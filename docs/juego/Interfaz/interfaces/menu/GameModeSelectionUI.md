---
    sidebar_position: 2
---

# GameModeSelectionUI

![Ejemplo ](../../../../../static/juego-img/interfaz/interfaces/menu/GameModeSelectionUI.png)

## Descripción

La interfaz **GameModeSelectionUI** está diseñada para permitir al usuario seleccionar el modo de juego que desea continuar. Esta interfaz separa el "flujo de ejecución" de los menús en dos: el flujo normal y el flujo online. Contiene dos botones que permiten al usuario elegir entre estos dos modos de juego, proporcionando una forma clara y directa de tomar la decisión.

---

## Controlador

El controlador de la interfaz **GameModeSelectionUI** maneja únicamente referencias directas a sus elementos. Su función principal es determinar qué tipo de atributos se deben gestionar, ya que este es el menú que separa el flujo de ejecución según el botón que se haga clic. Dependiendo de la selección, el controlador dictará el flujo a seguir, ya sea el flujo normal o el flujo online.


```csharp
namespace UI.Controllers.Views.Menu
{
    public class GameModeSelectionUI : Core.UI
    {
        private GameObject _object;

        //Declaracion Elementos
        private VisualElement _containerMain;
        private Button _btnOnline;
        private Button _btnOffline;
        private Button _btnBack;

        //Auxiliar
        private GameManagerAttributes.GameManagerModelAttributes _attributes; //contexto Local

        //----------FLUJO EJECUCION-----------
        public GameModeSelectionUI()
        {
            GameEventBus<GameManagerAttributes.GameManagerModelAttributes>.Subscribe("MainScreen", Init);
            Debug.Log("CONSTRUYENDO: GameModeSelectionUI");
        }

        public override void InitInstance(GameObject ui)
        {
            _object = ui;
        }

        public override void Init(object attributes)
        {
            if (attributes.GetType() != typeof(GameManagerAttributes.GameManagerModelAttributes))
            {
                Debug.LogError("TIPO DE DATO DIFERENTE A NORMALMODE");
                return;
            }
            _attributes = attributes as GameManagerAttributes.GameManagerModelAttributes;
        }

        public override void SetOpen<T>(T context) where T : class
        {
            //Flujo ejecucion...
        }

        //Más métodos...
    }
}
```