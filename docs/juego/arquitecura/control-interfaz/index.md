---
    sidebar_position: 3
---

# Control de Interfaz

El sistema de control visual es responsable de gestionar y actualizar las interfaces de usuario, manejando la interacción con los elementos visuales del juego o aplicación. Además, se asegura de que los cambios de estado visual, como la transición de pantallas o la actualización de elementos dinámicos, se ejecuten correctamente según la lógica del juego.

## Desglose de clases

|Nombre|Tipo|Namespace|Descripción|
|-|-|-|-|
|UIManager|`class`|Managers|Director encargado de la carga de interfaces|
|ModalManager|`class`|Managers|Director encargado de la carga de modales|
|AnimatorCommand|`class`|Core|Director encargado de hacer que las animaciones sean ejecutadas correctamente|
|UI|`abstract`|Core|Clase en la que se basan estructuralmente las interfaces|