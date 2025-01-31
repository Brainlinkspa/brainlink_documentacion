---
    sidebar_position: 4
---

# NormalMode

## Descripción
```csharp
public class NormalMode :  GameModeBase<NormalModeAttributes>
```
La clase `NormalMode` define al modo de juego normal, hereda tanto métodos escenciales como instancias únicas de clases clave de [`GameModeBase`](/docs/juego/arquitecura/control-juego/GameModeBase). Dentro de esta clase, se definen los atributos y la lógica exclusiva para el modo de juego normal, adaptando el comportamiento a las necesidades particulares de este tipo de juego.


---

## Variables y atributos

- Las instancias únicas son heredadas de [`GameModeBase`](/docs/juego/arquitecura/control-juego/GameModeBase)
- Los atributos clave de esta clase son obtenidos desde `NormalModeAttributes`
- `NormalModeController controller`: Controlador especial de la logica del juego

---

## Funciones y métodos
Los métodos son obtenidos y adaptados de la interfaz [`IGameMode`](/docs/juego/arquitecura/control-juego/GameModeBase/IGameMode)

### StartMode
```csharp
public override void StartMode()
```
Se encarga de iniciar la logica y la interfaz del juego, esto lo realiza por las instancias únicas del modo de juego `uiManager` y `listEvent`.

Importante destacar que `listEvent` necesita de `controller` para ser instanciado correctamente, donde deberá recibir el tipo de atributos del modo de juego (en este caso `NormalModeAttributes`) para su inicialización.

### UpdateMode
```csharp
public override void UpdateMode()
```
-

### EndMode
```csharp
public override void EndMode()
```
-

