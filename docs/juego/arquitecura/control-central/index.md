---
    sidebar_position: 1
---

# Control Central

Es el sistema de control central del proyecto, hace el llamado inicial e inicialización de los subsistemas según se necesiten.

## Desglose de clases

|Nombre|Tipo|Namespace|Descripción|
|-|-|-|-|
|[GameManager](/docs/juego/arquitecura/control-central/GameManager)|`MonoBehaviour`|Core|Clase principal que controla la lógica central del juego.|
|[GameEventBus](/docs/juego/arquitecura/control-central/GameEventBus)|`static <T>`|Core|Clase que actúa como un bus de eventos para el sistema.|