# NodeEvent

## Descripción

```csharp
public class NodeEvent
```
La clase `NodeEvent` representa un nodo individual en la lista de eventos de `ListEvent`. Los nodos pueden almacenar eventos con o sin parámetros, y se pueden crear mediante diferentes constructores que aceptan distintas combinaciones de parámetros. Esta estructura está contenida e instanciada dentro de `ListEvent` para encadenar los eventos y ejecutar la lógica asociada en secuencia.

---

## Variables y atributos

- `int numberNode`: Es el identificador del nodo, se asigna cuando es añadido a una lista de eventos.
- `string nameAction`:  El nombre de la acción asociada al evento.
- `Func<object> onInvoke { get; set; }`: Almacena la lógica que se debe ejecutar cuando se invoca el evento, no recibe párametros y devuelve un tipo `object`.
- `Func<object,object> onInvkeParams { get; set; }`: Almacena la lógica que se debe ejecutar cuando se invoca el evento, recibe y devuelve un tipo `object`.
- `NodeEvent Next { get; set; }`: Almacena la referencia al evento siguiente.

