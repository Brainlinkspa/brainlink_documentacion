---
    sidebar_position: 3
---

# AnimatorCommand

## Descripción
```csharp
public class AnimatorCommand
```

La clase `AnimatorCommand` gestiona una serie de comandos que deben ejecutarse de manera secuencial dentro de un sistema de animación o eventos. Mantiene una cola de comandos, donde los comandos se agregan en un orden específico y se ejecutan uno por uno, asegurando que no se inicien nuevos comandos mientras uno esté en proceso. La clase gestiona el flujo de estos comandos a través de una bandera que indica si ya se está ejecutando un comando, evitando la ejecución simultánea de múltiples comandos.

A medida que los comandos se agregan a la cola, la clase se asegura de que cada uno se ejecute solo cuando el anterior haya finalizado. Esto permite que los comandos, que podrían estar relacionados con animaciones o eventos en el juego, se manejen de forma organizada y sin solapamientos. La implementación permite un control preciso sobre el orden y la secuencia en que los comandos se ejecutan, proporcionando una experiencia fluida y controlada en la aplicación.

---
## Variables y Atributos

- **`_commandsToExecute`**:  Es una cola (`Queue<IGameCommand>`) que almacena los comandos que se deben ejecutar en orden secuencial. Los comandos son objetos que implementan la interfaz `IGameCommand` y se van encolando para su posterior ejecución.

- **`_runningCommand`**:  Es un valor booleano que indica si actualmente se está ejecutando un comando. Si es `true`, significa que un comando está en ejecución y no se puede ejecutar otro hasta que el actual termine. Evita la ejecución concurrente de múltiples comandos.


---
## Funciones y Métodos

### AddCommand
```csharp
public void AddCommand(IGameCommand commandToEnqueue)
```
Este método se encarga de agregar un nuevo comando a la cola de comandos que se deben ejecutar. El comando es pasado como un parámetro de tipo `IGameCommand`. Luego de agregar el comando, invoca el método `RunNextCommand` para asegurarse de que los comandos se ejecuten de forma secuencial. 

---

### RunNextCommand
```csharp
private async Task RunNextCommand()
```
Este es un método privado que gestiona la ejecución de los comandos de la cola. Si ya hay un comando en ejecución, el método no hace nada, evitando la ejecución concurrente. En caso contrario, comienza a ejecutar los comandos en la cola, uno por uno, hasta que no queden más comandos. Utiliza `await` para asegurarse de que cada comando se complete antes de pasar al siguiente.

---

## Listado de Commands

|Nombre|Namespace|Descripción|
|-|-|-|
|`ListEventCommand`|Command|Comando generico que puede tomar cualquier función o método y lo agrega a la cola|
|`TransitionsCommand`|Command|Comando Diseñado para manejar las animaciones de transiciones de las interfaces|
|`CardGiveCommand`|Commands.Views.Board|Comando para entregar cartas a los jugadores|
|`PlayersEntranceCommand`|Commands.Views.Board|Comando para manejar las animaciones de entrada y salida de los jugadores al cambiar turno|
|`RotateCardsCommand`|Commands.Views.Board|Comando para rotar las cartas de un jugador al comienzao de la partida|
|`ConceptRouletteCommand`|Commands.Views.ChooseConcept|Comando para manejar la ruleta de selección de conceptos|
|`ManageSelectionCommand`|Commands.Views.ChooseConcept|Comando para manejar las animaciones despues de la selección de conceptos|
|`GiveEventCardsCommand`|Commands.Views.Events|Comando para entregar las cartas de evento|
|`ManageModifierCommand`|Commands.Views.Events|Comando para Mmanejar el modificador de un evento recien activado|
|`RotateEventCardCommand`|Commands.Views.Events|Comando para rotar una carta de evento|
|`RotatePendulumSelectorCommand`|Commands.Views.Events|Comando para manejar la animacion de giro del pendulo|
|`ShowElements`|Commands.Views.Events|Comando para mostrar u ocultar dinamicamente elementos de una interfaz|
|`RotateRouletteCommand`|Commands.Views.Roulette|Comando para girar la ruleta de eventos|