---
    sidebar_position: 1
---

# UIManager

## Descripción
```csharp
public class UIManager
```

`UIManager` es una clase central encargada de gestionar la interfaz de usuario (UI) del juego. Su función principal es instanciar y manejar las diferentes pantallas y modales del juego, asociándolos a través de diccionarios que almacenan las referencias de los GameObjects y sus instancias correspondientes. Utiliza reflexión para recorrer las clases de atributos de la interfaz y los modales, buscando los campos que contienen referencias a GameObjects y asociándolos a tipos de clases específicas dentro del espacio de nombres proporcionado. Esta clase facilita la inicialización dinámica de las pantallas y modales, asegurando que se carguen correctamente y se gestionen de forma eficiente durante la ejecución del juego.

Además, `UIManager` interactúa con el `ModalManager`, pasando las referencias de los modales y asegurando que se manejen correctamente los eventos dentro del flujo de la interfaz. Su arquitectura permite que se integren múltiples pantallas y modales en un sistema modular y flexible, facilitando el manejo de la UI a lo largo de las distintas fases del juego.

---

### Variables y Atributos

- `instanceUI`:
Un diccionario que asocia tipos (`Type`) con instancias de la clase `Core.UI`. Se utiliza para almacenar las instancias de las interfaces de usuario que han sido creadas dinámicamente.

-  `referencesUI`:
Un diccionario que asocia tipos (`Type`) con referencias a los `GameObject` de la interfaz. Se usa para almacenar los `GameObject` asociados a las interfaces de usuario.

-  `referencesModals`:
Similar a `referencesUI`, pero este diccionario está destinado a almacenar las referencias de los modales (pantallas emergentes) del juego.

-  `modalManager`:
Una instancia del `ModalManager`, responsable de gestionar los modales del juego.

- `nameSpace`:
Una cadena que contiene el espacio de nombres para las clases de la interfaz y los modales, utilizado para buscar dinámicamente los tipos de clases correspondientes a los `GameObject`.

---

## Funciones y Métodos

### Init

```csharp
public void Init<TInterfaceAttributes, TModalAttributes>(TInterfaceAttributes interfaceAttributes, TModalAttributes modalsAttributes)
```

Este método es responsable de inicializar las interfaces de usuario (UI) y los modales. Utiliza reflexión para obtener todos los campos de tipo `GameObject` de las clases de atributos proporcionadas (`TInterfaceAttributes` y `TModalAttributes`). Luego, instanciará las clases correspondientes y las asociará a las pantallas y modales del juego. Los objetos `UI` creados se almacenan en los diccionarios `instanceUI` y `referencesUI` para las interfaces, y `referencesModals` para los modales, finalmente enviando los `referencesModals` a el modalManager instanciado en sus variables con `PassModalsToModalManager()`.

---

### PassModalsToModalManager

```csharp
public void PassModalsToModalManager()
```

Este método pasa las referencias de los modales y las instancias de las interfaces al `ModalManager`. Inicializa el `ModalManager` con las referencias de los modales y las instancias de las interfaces, lo que facilita la gestión de los modales dentro de la aplicación.



