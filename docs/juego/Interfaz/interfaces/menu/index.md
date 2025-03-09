---
    sidebar_position: 1
---

# Interfaces Menu

Las Interfaces Menu son aquellas utilizadas en la etapa previa al inicio de una partida. Estas interfaces permiten a los usuarios seleccionar opciones importantes, como el modo de juego, el mazo de cartas, los jugadores, o la configuración general de la partida. Son pantallas clave que ayudan a configurar la experiencia antes de que el juego comience. Dependiendo de la estructura del juego, estas interfaces pueden ser modales que se muestran por encima de la interfaz principal o formas de navegación dentro de la misma.

## Funcionamiento general

Las interfaces del menú funcionan mediante la compartición de datos a través de eventos de suscripción simples, gestionados internamente por cada interfaz. Esto permite una comunicación fluida y la actualización de la información entre las diferentes pantallas. Cada interfaz está referenciada y gestionada de manera centralizada a través de las instancias de **UIManager** y **ModalManager** dentro del **GameManager**. Esto asegura que todas las pantallas se mantengan sincronizadas y controladas de forma coherente durante la navegación entre ellas, facilitando la transición entre las diferentes fases del juego y las opciones de configuración del usuario.



## Listado de interfaces

| Nombre | Tipo | Namespace | Jerarquía | Descripción |
|--------|------|-----------|-----------|-------------|
| [MainScreenUI](/docs/juego/Interfaz/interfaces/menu/MainScreenUI) | Interfaz "madre" | UI.Controllers.Views.Menu | 0 | Menú principal del Juego |
| [GameModeSelectionUI](/docs/juego/Interfaz/interfaces/menu/GameModeSelectionUI) | Modal | UI.Controllers.Views.Menu | 1 | Menú de selección del juego |
| [DeckSelectionUI](/docs/juego/Interfaz/interfaces/menu/DeckSelectionUI) | Modal | UI.Controllers.Views.Menu | 2 | Menú de selección de mazo de cartas |
| [SubjectSelectionUI](/docs/juego/Interfaz/interfaces/menu/SubjectSelectionUI) | Modal | UI.Controllers.Views.Menu | 3 | Menú de selección de materia del mazo |
| [PlayerSelectionUI](/docs/juego/Interfaz/interfaces/menu/PlayerSelectionUI) | Modal | UI.Controllers.Views.Menu | 3 | Menú de selección de jugadores |
| [AvatarSelectionUI](/docs/juego/Interfaz/interfaces/menu/AvatarSelectionUI) | Modal | UI.Controllers.Views.Menu | 4 | Menú de selección de avatar de un jugador |
| [MatchConfigUI](/docs/juego/Interfaz/interfaces/menu/MatchConfigUI) | Modal | UI.Controllers.Views.Menu | 4 | Menú de configuración de una partida |



