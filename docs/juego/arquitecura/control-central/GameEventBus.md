---
    sidebar_position: 2
---

# GameEventBus

## Descripción
```csharp
public static class GameEventBus<T> where T : class
```
La clase `GameEventBus` es una implementación genérica de un sistema de bus de eventos, diseñado para gestionar la suscripción, publicación y desuscripción de eventos dentro de un juego. Se utiliza para desacoplar componentes del juego, permitiendo que diferentes partes del código se comuniquen de manera eficiente sin depender directamente unas de otras.

Esto se consigue gracias al uso de `<T>`, lo que hace que la clase sea genérica y permita manejar eventos de cualquier tipo de datos. En lugar de crear versiones separadas del bus de eventos para cada tipo de evento, `T` actúa como un marcador de posición para el tipo de datos que se usará, ofreciendo flexibilidad y reusabilidad. Esto garantiza que la clase pueda ser utilizada con diferentes tipos de eventos mientras mantiene la seguridad de tipos y reduce la duplicación de código.

---

## Funciones y métodos

### Subscribe
```csharp
public static void Subscribe(string nameEvent, Action<T> listener)
```
Permite que un listener  se suscriba a un evento específico. Cuando el evento se publique, el listener será llamado.

Si el evento no existe aún en el diccionario `_eventListeners`, se crea una lista de listeners para ese evento. Luego, agrega el listener a la lista de suscriptores del evento correspondiente.
### Publish
```csharp
public static void Publish(string eventName, T eventArgs)
```
Publica un evento, lo que hace que todos los listeners suscritos a ese evento se ejecuten.

Si el evento existe en el diccionario `_eventListeners`, recorre la lista de listeners y les pasa los argumentos del evento. Luego, cada listener se ejecuta con los parámetros proporcionados.


### Unsubscribe
```csharp
public static void Unsubscribe(string eventName, Action<T> listener) 
```
Permite que un listener se desuscriba de un evento, evitando que se ejecute cuando el evento sea publicado.

Si el evento existe en el diccionario `_eventListeners`, se busca y elimina el listener específico de la lista de suscriptores. Igualmente, si después de eliminar el listener, la lista de suscriptores está vacía, también se elimina la entrada del evento del diccionario.

---

## Ejemplos

A continuación se proporcionaran ejemplos de uso referente a otras clases similares.


```csharp
//Clase singleton
public class ModalManager
{
    public void OpenModal(Type typeInstanceReference){

    }
}

//Uso de GameEventBus en clase externa (Por ejemplo un UI)
GameEventBus<ModalManager>.Instance.OpenModal(typeof(GiveScoreUI));
```
