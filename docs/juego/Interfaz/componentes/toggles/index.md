---
sidebar_position: 6
---

# Toggles

Un **toggle** es un componente de interfaz de usuario que permite alternar entre dos estados, generalmente representados como "activo" o "inactivo". Se utiliza comúnmente en configuraciones o para activar/desactivar opciones. Los toggles ofrecen una forma simple e intuitiva para que los usuarios realicen selecciones binarias, como encender o apagar una función dentro de la aplicación o el juego.

---

## Construcción General

Todos los toggles (salvo una excepción) no cuentan con un controlador propio y son manejados directamente por la interfaz. De forma general, todos los toggles utilizan el componente Toggle proporcionado por UIToolkit y siguen una construcción similar. La única variación entre ellos es en sus estilos, los cuales son modioficados dependiendo de para que se utilice.

## Tipos de Toggles

A continuación se describen los diferentes tipos de toggles, que se diferencian en la forma en que son utilizados y configurados dentro del sistema:

- **[Evento](evento)**: Toggles para la configuración de cartas de evento, permitiendo activar o desactivar opciones específicas de eventos.

- **[Genérico](generico)**: Toggles de uso general, adaptables a diferentes contextos dentro de la interfaz.

- **[Listado](listado)**: Toggles usados en listas de opciones, permitiendo seleccionar múltiples opciones dentro de un contenedor.

