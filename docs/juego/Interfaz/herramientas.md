---
    sidebar_position: 1
---

# Herramientas Utilizadas

En esta sección se detallan las herramientas utilizadas para el desarrollo de las interfaces, así como las soluciones personalizadas implementadas para superar limitaciones y mejorar la experiencia del usuario.

---

## Unity UI Toolkit

UI Toolkit es una herramienta incluida en Unity, diseñada específicamente para la creación de interfaces de usuario. Se basa en principios similares al diseño web, utilizando conceptos como flexboxes y CSS, pero adaptados al entorno de Unity. A través de esta herramienta, se pueden definir la estructura, el estilo y la interacción de los elementos de la interfaz, permitiendo un diseño modular y flexible dentro del sistema diseñado para el juego. La estructuración para la construcción de los elementos es la siguiente:

- **UXML**: Similar a HTML, utilizado para definir la estructura de la interfaz de usuario.
- **USS**: Hojas de estilo (similar a CSS) que permiten controlar la apariencia y el diseño de los elementos creados con UXML.
- **C#**: Utilizado para manejar la lógica de interacción con los elementos de la interfaz.

Para este proyecto, se hace uso de la versión de UI Toolkit incluida en `Unity 2021.3.25f1`.

---

## DOTween

DOTween es una herramienta externa optimizada para la animación dentro de Unity, diseñada para facilitar la creación de transiciones suaves y efectos visuales. Utiliza un sistema basado en tweens, lo que permite animar propiedades de objetos, como la posición, rotación, escala y color, de manera sencilla y eficiente.

### Extensión Personalizada: DOTweenExtension

Para este proyecto, se desarrolló una extensión personalizada para adaptar las transformaciones predeterminadas de UI Toolkit al sistema DOTween. Aunque UI Toolkit ofrece herramientas para animar interfaces, estas resultan limitadas para ciertos tipos de animaciones complejas. Además, UI Toolkit no es directamente compatible con las funciones de DOTween, lo que obligó a crear una solución que integrara ambas tecnologías. Así, se implementó una extensión llamada `DOTweenExtension`, que utiliza las funciones genéricas de DOTween para adaptar las transformaciones nativas de UI Toolkit, permitiendo animaciones más dinámicas y fluidas dentro de las interfaces.

---

## AnimatorCommand

`AnimatorCommand` es una clase personalizada creada específicamente para ejecutar acciones de manera secuencial dentro del flujo de juego. Utiliza el patrón de diseño **Command**, lo que permite que las animaciones y eventos definidos por la interfaz se completen antes de que el código continúe su ejecución. Esto garantiza fluidez en las animaciones y asegura que el flujo de juego no se vea interrumpido.

### Uso de AnimatorCommand

El `AnimatorCommand` se instancia dentro del `GameManager` y debe ser utilizado a través de `GameEventBus<AnimatorCommand>`. Para acciones puntuales, se puede hacer uso de la clase `ListEventCommand`, que acepta cualquier tipo de función. Alternativamente, para acciones más complejas, es posible crear comandos específicos para cada interfaz o elemento, según las necesidades del proyecto.
