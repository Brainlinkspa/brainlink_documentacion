---
sidebar_position: 1
---

# Toggles de Evento

Los **Toggles de Evento** son elementos preconfigurados que se utilizan en la interfaz para el manejo de activación/desactivación de algún evento de las cartas de evento.

---

## Construcción

Todos los toggles de evento están construidos en base al USS "eventToggle", y cada Toggle prefabricado además cuenta con una clase propia para el manejo de su textura. Por construcción, todos son simplemente un toggle con su nombre correspondiente.

![Ejemplo ](../../../../../static/juego-img/interfaz/componentes/toggles/evento.png)![Ejemplo ](../../../../../static/juego-img/interfaz/componentes/toggles/evento2.png)
![Ejemplo ](../../../../../static/juego-img/interfaz/componentes/toggles/evento3.png)


---

## Uso

Se arrastran directamente a la interfaz y se envuelven en un **TemplateContainer**. La gestión lógica de estos elementos es responsabilidad de la interfaz en cuestión, ya que cada Toggle puede llevar a un evento diferente dependiendo de la interacción que se requiera.

![Ejemplo ](../../../../../static/juego-img/interfaz/componentes/toggles/evento4.png)

```csharp
//En interfaz
Toggle toggle; //Instanciado

toggle = _root.Q<Toggle>("evento"); //Referencia directa
```

---

## Listado de Elementos




| Nombre             | Estado Activo                                           | Estado Inactivo                                      |
|--------------------|---------------------------------------------------------|------------------------------------------------------|
| **BonusToggle**     | <img src="/juego-img/interfaz/componentes/toggles/icon_event_bonus.png" width="100" height="100" /> | <img src="/juego-img/interfaz/componentes/toggles/icon_event_bonus_inactive.png" width="100" height="100" /> |
| **HelpToggle**      | <img src="/juego-img/interfaz/componentes/toggles/icon_event_help.png" width="100" height="100" />  | <img src="/juego-img/interfaz/componentes/toggles/icon_event_help_inactive.png" width="100" height="100" />  |
| **QuestionToggle**  | <img src="/juego-img/interfaz/componentes/toggles/icon_event_question.png" width="100" height="100" /> | <img src="/juego-img/interfaz/componentes/toggles/icon_event_question_inactive.png" width="100" height="100" /> |
| **TimeToggle**      | <img src="/juego-img/interfaz/componentes/toggles/icon_event_time.png" width="100" height="100" />  | <img src="/juego-img/interfaz/componentes/toggles/icon_event_time_inactive.png" width="100" height="100" />  |
| **TrapToggle**      | <img src="/juego-img/interfaz/componentes/toggles/icon_event_trap.png" width="100" height="100" /> | <img src="/juego-img/interfaz/componentes/toggles/icon_event_trap_inactive.png" width="100" height="100" /> |







