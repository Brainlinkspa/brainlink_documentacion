---
    sidebar_position: 4
---

# Interfaces

Las **Interfaces** son componentes fundamentales que permiten la interacción del usuario con el sistema. Están diseñadas para proporcionar una experiencia visual coherente y eficiente, adaptándose a las necesidades del usuario y al flujo del juego. Estas interfaces incluyen pantallas, menús y otros elementos interactivos que facilitan la comunicación entre el usuario y el sistema.  

---

## Tipos de Interfaces

En el sistema de interfaz de usuario, existen dos tipos principales de interfaces: las **Interfaces "madre"** y los **modales**.

- **Interfaces "madre"**: Son interfaces principales que contienen la estructura básica de la aplicación o el juego, sirviendo como la base para organizar y mostrar otros elementos de la interfaz de usuario.

- **Modales**: Son interfaces emergentes que se muestran encima de las interfaces "madre", generalmente para mostrar contenido específico o para realizar interacciones temporales.

A pesar de sus diferencias en la estructura, ambos tipos de interfaces siguen el mismo principio de funcionamiento, todas siguen el mismo flujo de subscripción a un evento y todas requieren de un UIDocument y un controlador para su funcionamiento.

Para obtener más información sobre la implementación de la lógica de las interfaces, consulta la sección de [Lógica de Interfaces](../implementacion/implementacion-logica#lógica-de-interfaces).

Si necesitas saber el cómo construir una interfaz desde cero, te recomendamos revisar el punto dos de la implementación técnica [Construcción del UIDocument](../implementacion/construccion-uidocument).

Además, si necesitas entender cómo vincular la interfaz al flujo del juego y a una escena, te recomendamos revisar la sección sobre [Asociado a la Escena Unity](../implementacion/asociado-escena).


---




## Uso de interfaces 

A continuación, se presentan los usos de las interfaces según a que lugar pertenecen:

- **[Menu](/docs/juego/Interfaz/interfaces/menu)**: Interfaces utlizadas antes de comenzar una partida.
- **[Game](/docs/juego/Interfaz/interfaces/game)**: Interfaces utilizadas durante una partida.
- **[Modal](/docs/juego/Interfaz/interfaces/modal)**: Interfaces que pueden ser utilizadas por cualquiuer otra en cualquier contexto.