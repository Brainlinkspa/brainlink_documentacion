---
    sidebar_position: 1
---

# IGameMode

## Descripción
```csharp
public interface IGameMode
```
La interfaz `IGameMode` define la estructura básica que deben implementar todos los modos de juego en el sistema. Garantiza que cualquier clase que represente un modo de juego implemente métodos esenciales para gestionar el ciclo de vida del juego de manera consistente.

---
## Funciones y metodos
Se declaran tres métodos escenciales.

### StartMode
```csharp
public void StartMode()
```
Pensado para iniciar un modo de juego.

### UpdateMode
```csharp
public void UpdateMode()
```
Pensado para actualizar un modo de juego.

### EndMode
```csharp
public void EndMode()
```
Pensado para finalizar un modo de juego.
