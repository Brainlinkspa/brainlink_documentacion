---
    sidebar_position: 1
---

# MainScreenUI

![Ejemplo ](../../../../../static/juego-img/interfaz/interfaces/menu/MainScreenUI.png)

## Descripción

La **Interfaz madre** de la escena principal (Main) actúa como la base para los menús del juego. En esta interfaz se encuentran los botones clave que permiten la navegación en el menú principal, tales como:

- **Botón de salida**: Permite salir del juego.
- **Botón de opciones**: Abre el menú de configuración.
- **Botón de tutorial**: Abre el tutorial para guiar al jugador.
- **Botón de selección de modo de juego**: Permite al jugador elegir el modo de juego.

Esta interfaz sirve como punto de inicio para la interacción del jugador con el sistema de menús, asegurando un acceso fácil a las principales funcionalidades del juego.

---

## Controlador

El controlador de la interfaz **MainScreenUI** maneja únicamente referencias directas a sus elementos. No recibe contexto adicional ni utiliza componentes auxiliares. Su función principal es gestionar la interacción con los elementos visibles, como botones y menús, sin necesidad de lógica compleja o dependencias externas.


```csharp
namespace UI.Controllers.Views.Menu
{
    public class MainScreenUI : Core.UI
    {
        private GameObject _object;

        //Declaracion Elementos
        private Button _btnPlay;
        private Button _btnExit;
        private Button _btnOptions;
        private Button _btnTutorial;


        //----------FLUJO EJECUCION-----------
        public MainScreenUI()
        {
            GameEventBus<GameManagerAttributes.GameManagerModelAttributes>.Subscribe("MainScreen", Init);
            Debug.Log("CONSTRUYENDO: MainScreenUI");
        }

        public override void InitInstance(GameObject ui)
        {
            _object = ui;
        }

        public override void Init(object attributes)
        {
            //Flujo ejecucion...

        }

        //Más métodos...
    }
}
```


