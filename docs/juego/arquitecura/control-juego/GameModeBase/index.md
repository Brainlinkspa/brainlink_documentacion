---
    sidebar_position: 2
---

# GameModeBase

## Descripción
```csharp
public abstract class GameModeBase<TAttributes> : IGameMode 
```
La clase `GameModeBase` es una clase abstracta que sirve como base para definir los métodos y variables escenciales de los modos de juego del sistema. Utiliza un tipo genérico `<TAttributes>` para permitir la personalización de los atributos específicos de cada modo e implementa la interfaz [`IGameMode`](/docs/juego/arquitecura/control-juego/GameModeBase/IGameMode) para obligar a todos los modos de juego a implementar los métodos escenciales.

---

## Variables y atributos

- `TAttributes Attributes`: Atributos del modo de juego
- `UIManager uiManager`: Instancia unica de UIManager para el modo de juego
- `ListEvent listEvent`: Instancia unica de ListEvent para el modo de juego

---

## Funciones y métodos

Los métodos son obtenidos de la interfaz [`IGameMode`](/docs/juego/arquitecura/control-juego/GameModeBase/IGameMode), no estan definidos y mantienen un tipo `abstract` para que cada modo de juego determine su logica individualmente.
