---
sidebar_position: 4
---

# Componentes Customizados

Los **Componentes customizados** son elementos clave diseñados para personalizar la interfaz de usuario según las necesidades específicas de la aplicación o el juego. Estos elementos pueden incluir botones, paneles, campos de texto, sliders, modales y otros elementos gráficos que permiten a los usuarios interactuar con el sistema. A diferencia de los componentes estándar, los componentes customizados están diseñados para cumplir funciones más específicas, y su comportamiento se controla a través de lógica personalizada asociada.

---

## Tipos de Componentes

En el sistema de interfaz de usuario, existen dos tipos principales de componentes: los **componentes directos** y los **componentes con controlador propio**. 

- **Componentes directos**: Son aquellos que se utilizan directamente en la interfaz y no requieren un controlador separado. Estos componentes son gestionados directamente por la instancia de la interfaz que los está utilizando.

- **Componentes con controlador propio**: Estos componentes cuentan con su propio controlador (controller) que maneja la lógica específica y las interacciones de dicho componente. Aunque tienen un controlador independiente, también son controlados por la instancia de la interfaz que los emplea, lo que asegura que funcionen de manera coherente dentro del flujo general de la interfaz.

A pesar de sus diferencias en la estructura, ambos tipos de componentes siguen el mismo principio de funcionamiento: son gestionados y controlados por la instancia de la interfaz que los está usando, lo que garantiza una integración fluida y consistente en la aplicación o juego.

Para obtener más información sobre la implementación de la lógica de los componentes que cuentan con un controlador, consulta la sección de [Lógica de Componentes](../implementacion/implementacion-logica#l%C3%B3gica-de-componentes).

Además, si necesitas entender cómo usar componentes customizados dentro de un **UIDocument**, te recomendamos revisar la sección sobre [Uso de Componentes Customizados](../implementacion/construccion-uidocument#uso-de-componentes-customizados).

---

## Listado de Componentes Customizados

A continuación, se presentan algunos de los componentes customizados utilizados en la interfaz:

- **[Botones](/docs/juego/Interfaz/componentes/botones)**: Elementos interactivos que permiten al usuario realizar acciones dentro de la UI.
- **[Barras (sliders)](/docs/juego/Interfaz/componentes/barras)**: Componentes visuales que se utilizan para mostrar progreso o valores en tiempo real.
- **[Cartas](/docs/juego/Interfaz/componentes/cartas)**: Componentes de estilo visual que presentan información o contenido de manera estructurada, en este caso, cartas de juego.
- **[Contenedores](/docs/juego/Interfaz/componentes/contenedores)**: Elementos que agrupan y organizan otros componentes dentro de la interfaz, incluye los contenedores dinamicos usados por **ListView**.
- **[Overlays](/docs/juego/Interfaz/componentes/overlays)**: Superficies transparentes o semi-transparentes que se muestran encima de otros elementos UI, usualmente para modales o pantallas de carga.
- **[Toggles](/docs/juego/Interfaz/componentes/toggles)**: Interruptores que permiten al usuario activar o desactivar opciones, similares a los botones de "encendido/apagado".
