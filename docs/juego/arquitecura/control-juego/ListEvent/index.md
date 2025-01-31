---
    sidebar_position: 3
---

# ListEvent

## Descripción
```csharp
public class ListEvent
```
La clase `ListEvent` gestiona una lista enlazada de eventos, donde cada evento está representado por un nodo `NodeEvent`. Permite agregar eventos a la lista y ejecutarlos de manera secuencial a través de métodos como `InvokeNode`, que invoca los eventos con o sin parámetros. La clase maneja un identificador único para cada nodo y asegura que los eventos se ejecuten en orden, avanzando automáticamente al siguiente nodo después de cada invocación.

---

## Variables y atributos

- `NodeEvent head`: Es el primer nodo de la lista de eventos, siendo la entrada inicial a la secuencia de eventos. 
- `int idNode`: Contador de eventos actuales en la lista.
- `bool flag`: Un indicador para controlar si se debe avanzar o no al siguiente nodo después de la primera invocación.

---

