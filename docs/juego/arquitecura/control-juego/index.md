---
    sidebar_position: 2
---

# Control del Juego

El sistema de control de juego se encarga de definir y gestionar la estructura lógica de los modos de juego, permitiendo su instanciación y configuración. Facilita su integración con el sistema central, garantizando la correcta ejecución de los diferentes modos según se necesiten.

## Desglose de clases

|Nombre|Tipo|Namespace|Descripción|
|-|-|-|-|
|[GameAdapter](/docs/juego/arquitecura/control-juego/GameAdapter)|`<TMode, TAttributes>`|Core|Adaptador para el instanciado de modos de juego|
|[GameModeBase](/docs/juego/arquitecura/control-juego/GameModeBase/)|`abstract <TAttribtes> : IGameMode`|Core|Clase en la que se basan estructuralmente los modos de juego|
|IGameMode|`interface`|Interfaces|Métodos escenciales de un juego|
|ListEvent|`class`|Core|Lista de eventos de un juego|
|NodeEvent|`class`|Core|Evento de un juego|


## Desglose de Modos de Juego
|Nombre|Tipo|Namespace|Descripción|
|-|-|-|-|
|NormalMode|`GameModeBase<NormalModeAttributes>`|Modes|Clase para el modo de juego Normal|