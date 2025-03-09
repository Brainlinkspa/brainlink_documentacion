---
    sidebar_position: 2
---

# Interfaces Game

Las **Interfaces Game** son las pantallas que se utilizan durante el desarrollo del juego, una vez que la partida ha comenzado. Estas interfaces están diseñadas para gestionar la interacción del jugador mientras juega, mostrando la información relevante del juego en tiempo real y permitiendo al usuario interactuar con diversos elementos del sistema.

Estas interfaces pueden incluir paneles para mostrar las cartas, las estadísticas del jugador, el estado del juego, entre otros. A diferencia de las interfaces de menú, las interfaces del juego no están orientadas a la configuración, sino a la experiencia activa del juego. Dependiendo de la estructura del juego, pueden incluir pantallas interactivas para eventos, selección de acciones, estadísticaso, y otras.


## Funcionamiento general

Las **Interfaces Game** funcionan a través del controlador asociado al modo de juego, que debe tener referencias previas a todas las interfaces que se van a utilizar. Estas referencias se gestionan mediante la instancia del modo de juego a través del **GameEventBus**, el cual es responsable de la comunicación y la transmisión de eventos entre las interfaces del juego. Este sistema de eventos está estrechamente vinculado a las suscripciones y los eventos gestionados por el controlador del modo de juego, lo que garantiza que cada interfaz esté sincronizada con el flujo del juego y reciba actualizaciones oportunas.

Cada interfaz está referenciada y gestionada de manera centralizada, lo que asegura que el controlador mantenga el control sobre las transiciones de la interfaz, permitiendo que el flujo del juego se ejecute sin interrupciones. Los eventos, suscripciones y la lógica asociada a las interfaces del juego permiten una interacción continua y fluida, lo que facilita la actualización de la información y la sincronización de las diferentes pantallas de manera coherente a medida que el jugador avanza por el juego.


## Listado de interfaces: Modo Normal

| Nombre | Tipo | Namespace | Jerarquía | Descripción |
|--------|------|-----------|-----------|-------------|
| [BoardUI](/docs/juego/interfaz/interfaces/game/BoardUI) | Interfaz "madre" | UI.Controllers.Views.Normal | 0 | Pantalla principal del tablero de juego. |
| [ChooseConceptUI](/docs/juego/interfaz/interfaces/game/ChooseConceptUI) | Modal | UI.Controllers.Views.Normal | 1 | Pantalla para seleccionar los conceptos del juego. |
| [ExplainConceptsUI](/docs/juego/interfaz/interfaces/game/ExplainConceptsUI) | Modal | UI.Controllers.Views.Normal | 1 | Pantalla para la exposición de los conceptos seleccionados. |
| [MasterUI](/docs/juego/interfaz/interfaces/game/MasterUI) | Modal | UI.Controllers.Views.Normal | 3 | Pantalla de gestión y control del puntaje de los jugadores. |
| [DrainModeUI](/docs/juego/interfaz/interfaces/game/DrainModeUI) | Modal | UI.Controllers.Views.Normal | 4 | Pantalla de configuración del modo drenaje en la partida. |
| [SelectPlayerDrainUI](/docs/juego/interfaz/interfaces/game/SelectPlayerDrainUI) | Modal | UI.Controllers.Views.Normal | 5 | Menú para seleccionar los jugadores en el modo drenaje. |
| [EventsUI](/docs/juego/interfaz/interfaces/game/EventsUI) | Modal | UI.Controllers.Views.Normal | 1 | Menú de configuración de las cartas de eventos del juego. |
| [RouletteUI](/docs/juego/interfaz/interfaces/game/RouletteUI) | Modal | UI.Controllers.Views.Normal | 2 | Pantalla de ruleta para la selección de eventos del juego. |
| [EventInfoUI](/docs/juego/interfaz/interfaces/game/EventInfoUI) | Modal | UI.Controllers.Views.Normal | 2 | Pantalla de descripción detallada de un evento seleccionado. |
| [QuestionEventUI](/docs/juego/interfaz/interfaces/game/QuestionEventUI) | Modal | UI.Controllers.Views.Normal | 2 | Pantalla para activar el evento de preguntas. |
| [HelpEventUI](/docs/juego/interfaz/interfaces/game/HelpEventUI) | Modal | UI.Controllers.Views.Normal | 2 | Pantalla para activar el evento de ayuda en el juego. |
| [TimeEventUI](/docs/juego/interfaz/interfaces/game/TimeEventUI) | Modal | UI.Controllers.Views.Normal | - | Pantalla para activar modificadores de eventos basados en tiempo. |
| [BonusEventUI](/docs/juego/interfaz/interfaces/game/BonusEventUI) | Modal | UI.Controllers.Views.Normal | 2 | Pantalla para activar el evento de bonificación. |
| [TrapEventUI](/docs/juego/interfaz/interfaces/game/TrapEventUI) | Modal | UI.Controllers.Views.Normal | 2 | Pantalla para activar el evento de trampa en el juego. |
| [PauseUI](/docs/juego/interfaz/interfaces/game/PauseUI) | Modal | UI.Controllers.Views.Normal | 3 | Pantalla de pausa del juego. |
| [ResultsUI](/docs/juego/interfaz/interfaces/game/ResultsUI) | Modal | UI.Controllers.Views.Normal | 1 | Pantalla para mostrar los resultados finales al terminar la partida. |






