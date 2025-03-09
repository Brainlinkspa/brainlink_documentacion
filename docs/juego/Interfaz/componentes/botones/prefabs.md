---
sidebar_position: 2
---

# Prefabs

Los **Prefabs** son elementos preconfigurados que se utilizan en la interfaz para facilitar la creación y reutilización de componentes. Estos elementos ya vienen con un estilo configurado y su logica puede ser modificada según las necesidades de la interfaz.

---

## Construcción

Todos los botones prefabricados están construidos en base al USS general "botones", y cada botón prefabricado además cuenta con una clase propia para el manejo de su textura. Por construcción, todos son simplemente un botón con su nombre correspondiente.

![Ejemplo ](../../../../../static/juego-img/interfaz/componentes/botones/botonPrefab3.png)![Ejemplo ](../../../../../static/juego-img/interfaz/componentes/botones/botonPrefab2.png)


---

## Uso

Se arrastran directamente a la interfaz y se envuelven en un **TemplateContainer**. La gestión lógica de estos elementos es responsabilidad de la interfaz en cuestión, ya que cada botón o prefab puede tener un comportamiento diferente dependiendo de la interacción que se requiera.

![Ejemplo ](../../../../../static/juego-img/interfaz/componentes/botones/botonPrefab.png)

```csharp
//En interfaz
Button button; //Instanciado

button = _root.Q<Button>("botonVer"); //Referencia directa
```

---

## Listado de Elementos




| Nombre               | Visualización                                            |
|----------------------|-----------------------------------------------------------|
| Boton Activar        | <img src="/juego-img/interfaz/componentes/botones/botonPrefabLista1.png" width="100" height="100" /> |
| Boton Back           | <img src="/juego-img/interfaz/componentes/botones/botonPrefabLista2.png" width="100" height="100" /> |
| Boton Book           | <img src="/juego-img/interfaz/componentes/botones/botonPrefabLista3.png" width="100" height="100" /> |
| Boton Burbuja Texto  | <img src="/juego-img/interfaz/componentes/botones/botonPrefabLista4.png" width="100" height="100" /> |
| Boton Cancelar       | <img src="/juego-img/interfaz/componentes/botones/botonPrefabLista5.png" width="100" height="100" /> |
| Boton Cerrar         | <img src="/juego-img/interfaz/componentes/botones/botonPrefabLista6.png" width="100" height="100" /> |
| Boton Config         | <img src="/juego-img/interfaz/componentes/botones/botonPrefabLista7.png" width="100" height="100" /> |
| Boton Config Prefab  | <img src="/juego-img/interfaz/componentes/botones/botonPrefabLista8.png" width="100" height="100" /> |
| Boton Confirmar      | <img src="/juego-img/interfaz/componentes/botones/botonPrefabLista9.png" width="100" height="100" /> |
| Boton Home           | <img src="/juego-img/interfaz/componentes/botones/botonPrefabLista10.png" width="100" height="100" /> |
| Boton Info           | <img src="/juego-img/interfaz/componentes/botones/botonPrefabLista11.png" width="100" height="100" /> |
| Boton Next           | <img src="/juego-img/interfaz/componentes/botones/botonPrefabLista12.png" width="100" height="100" /> |
| Boton Opciones       | <img src="/juego-img/interfaz/componentes/botones/botonPrefabLista13.png" width="100" height="100" /> |
| Boton Pausa          | <img src="/juego-img/interfaz/componentes/botones/botonPrefabLista14.png" width="100" height="100" /> |
| Boton Regresar       | <img src="/juego-img/interfaz/componentes/botones/botonPrefabLista15.png" width="100" height="100" /> |
| Boton Ruleta         | <img src="/juego-img/interfaz/componentes/botones/botonPrefabLista16.png" width="100" height="100" /> |
| Boton Salir          | <img src="/juego-img/interfaz/componentes/botones/botonPrefabLista17.png" width="100" height="100" /> |
| Boton Seguir         | <img src="/juego-img/interfaz/componentes/botones/botonPrefabLista18.png" width="100" height="100" /> |
| Boton Ver            | <img src="/juego-img/interfaz/componentes/botones/botonPrefabLista19.png" width="100" height="100" /> |





