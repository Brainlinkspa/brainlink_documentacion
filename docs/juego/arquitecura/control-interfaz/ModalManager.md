---
    sidebar_position: 2
---

# ModalManager

## Descripción
```csharp
public class ModalManager 
```

`ModalManager` es una clase responsable de gestionar el ciclo de vida de los modales en una aplicación, proporcionando una forma organizada de manejar ventanas emergentes dentro de la interfaz de usuario. Su función principal es controlar la apertura y el cierre de los modales, asegurando que se presenten de manera ordenada y en el momento adecuado, manteniendo una secuencia lógica en la interfaz.

A través de su estructura, `ModalManager` permite interactuar con modales de manera eficiente, gestionando la pila de modales abiertos y garantizando que se cierre el modal correcto en el orden esperado. Además, facilita la personalización de la experiencia del usuario mediante la capacidad de pasar datos adicionales a los modales cuando sea necesario. Su diseño permite un manejo dinámico y flexible de las ventanas emergentes, optimizando la experiencia de usuario dentro del entorno de la aplicación.

---

## Variables y Atributos
- **`_instanceUI`**: Diccionario que asocia tipos de `Core.UI` a sus instancias correspondientes.
- **`_referencesModals`**: Diccionario que mapea tipos de `GameObject` a modales específicos.
- **`_activeModals`**: Pila (`Stack<GameObject>`) que mantiene un seguimiento de los modales abiertos de manera secuencial.
- **`OnModalClosed`**: Evento que se dispara cuando un modal es cerrado, proporcionando información adicional sobre el modal cerrado.



---

## Funciones y Métodos

### Constructores
```csharp
public ModalManager(Dictionary<Type, GameObject> _referencesModals, Dictionary<Type, Core.UI> instanceUI)
```
Este es el constructor de la clase `ModalManager` que recibe dos diccionarios como parámetros. El primer diccionario, `_referencesModals`, mapea tipos de modales (usando `Type`) con sus correspondientes objetos `GameObject` en Unity. El segundo diccionario, `instanceUI`, mapea tipos de modales con instancias de la clase `Core.UI` que gestionan la lógica de cada modal. Este constructor inicializa las referencias y las instancias, permitiendo al `ModalManager` operar con modales específicos al recibir estos datos.

```csharp
public ModalManager()
```
Igualmente, se cuenta con un constructor por defecto que permite la creación de una instancia vacía del `ModalManager`. No recibe ningún parámetro, lo que significa que las referencias de los modales y las instancias de UI no se configuran de inmediato. Este constructor es útil cuando se desea configurar el `ModalManager` después de su creación a través de otros métodos o setters.

---

### OpenModal
```csharp
public void OpenModal<T>(Type typeInstanceReference, T additionalData = null) where T : class
```
Este método es responsable de abrir un modal específico basado en el tipo `typeInstanceReference`. El tipo del modal se pasa como un parámetro `Type`, y `additionalData` es un parámetro opcional que permite enviar información adicional al modal cuando se abre. Si los datos adicionales son `null`, simplemente se abre el modal sin cambios. Si el modal existe en el diccionario de referencias, se activa su correspondiente `GameObject`, y se agrega a la pila de modales activos. La pila de modales asegura que se pueda manejar la visualización y cierre de los modales en un orden apropiado.

---

### CloseModal
```csharp
public void CloseModal(bool flag = false, string additionalInfo = "")
```
Esta función cierra el modal más reciente de la pila de modales activos. Primero, verifica si hay modales abiertos (si la pila no está vacía). Luego, elimina el modal superior de la pila, lo desactiva (con `SetActive(false)`) y dispara un evento `OnModalClosed`, proporcionando el nombre del modal cerrado, el valor de un indicador `flag` (que puede usarse para representar el estado de cierre, como un cierre normal o forzado) y cualquier información adicional (`additionalInfo`) que se haya pasado. Si no hay modales abiertos, se imprime una advertencia. Este método garantiza que los modales se cierren de forma ordenada y en el mismo orden en que fueron abiertos.

---

## Funcionamiento general
- **Abrir Modal**: Cuando se llama al método `OpenModal`, se busca el `GameObject` correspondiente en el diccionario de modales y se muestra en la interfaz. Si hay datos adicionales, estos se pasan al modal antes de mostrarlo.
- **Cerrar Modal**: Al llamar a `CloseModal`, el último modal en la pila se cierra y se elimina, y se dispara el evento `OnModalClosed` para informar sobre el cierre del modal.


