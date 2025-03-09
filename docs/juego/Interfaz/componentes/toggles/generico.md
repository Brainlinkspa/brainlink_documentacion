---
sidebar_position: 2
---

# Toggles Genericos

Los **Toggles Genericos** son elementos preconfigurados que se utilizan en la interfaz para el manejo de activación/desactivación de un contenedor, una Label o cualquier elemento.

---

## Construcción

Todos los toggles genéricos son simplemente el componente **Toggle** de UIToolkit. La única variación entre ellos es que cada uno cuenta con un **USS único** para el manejo de sus estilos. A excepción de esto, por construcción, todos los toggles son simplemente instancias del componente **Toggle**.


![Ejemplo ](../../../../../static/juego-img/interfaz/componentes/toggles/generico.png)![Ejemplo ](../../../../../static/juego-img/interfaz/componentes/toggles/generico2.png)

![Ejemplo ](../../../../../static/juego-img/interfaz/componentes/toggles/generico3.png)

---

## Uso

Se arrastran directamente a la interfaz y se envuelven en un **TemplateContainer**. La gestión lógica de estos elementos es responsabilidad de la interfaz en cuestión, ya que cada Toggle puede llevar a un evento diferente dependiendo de la interacción que se requiera.

![Ejemplo ](../../../../../static/juego-img/interfaz/componentes/toggles/generico4.png)

```csharp
//En interfaz
Toggle toggle; //Instanciado

toggle = _root.Q<Toggle>("genericToggle"); //Referencia directa
```

---

## Listado de Elementos

| Nombre             | Estado Activo                                           | Estado Inactivo                                      |
|--------------------|---------------------------------------------------------|------------------------------------------------------|
| **GenericToggle**     | <img src="/juego-img/interfaz/componentes/toggles/genericToggle2.png" width="100" height="100" /> | <img src="/juego-img/interfaz/componentes/toggles/genericToggle.png" width="100" height="100" /> |
| **GenericToggleCircle**      | <img src="/juego-img/interfaz/componentes/toggles/genericToggleCircle2.png" width="100" height="100" />  | <img src="/juego-img/interfaz/componentes/toggles/genericToggleCircle.png" width="100" height="100" />  |
