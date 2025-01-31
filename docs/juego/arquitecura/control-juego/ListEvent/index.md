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

## Funciones y métodos

### Add
Son métodos para agregar un nodo nuevo a la lista de eventos, existen diversas formas de añadir uno según se vea necesario:
```csharp
public void Add(string nombreAction, NodeEvent nodeEvent)
```
Agrega tras buscar si ya existe un nodo con el nombre de acción. Si se encuentra, el nuevo nodo se agrega después de ese nodo.

```csharp
public void Add(NodeEvent nodeEvent)
```
Agrega al final de la secuencia. Si la lista está vacía, se convierte en el primer nodo; si no, se recorre la lista hasta encontrar el último nodo y se agrega al final.

### InvokeNode
Son métodos para invocar al primer nodo de la lista y ejecutar su lógica, existen diversas formas para realizar el llamado:

```csharp
public void InvokeNode<T>() where T : class
```
Al invocar, requiere de una clase (restricción necesaria para el correcto funcionamiento en los modos de juego)

```csharp
public void InvokeNode()
```
Al invocar, no necesita de ninguna clase.
