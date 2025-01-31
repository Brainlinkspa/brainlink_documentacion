---
    sidebar_position: 1
---

# GameManager
```csharp
public class GameManager : MonoBehaviour
```
La clase `GameManager` es la implementación central en el sistema del juego, diseñada para manejar la lógica principal del flujo del juego, maneja la inicialización y el ciclo de vida de los componentes clave del juego. Es responsable de coordinar eventos entre diferentes sistemas del juego.  Su responsabilidad incluye la inicialización de los modos de juego, la gestión de referencias a objetos clave (como pantallas y modales) y la coordinación de eventos a través de `GameEventBus`.

Debido a su rol, es la unica clase que deriva de `MonoBehaviour` lo que le permite integrarse de manera directa con el ciclo de vida de Unity, como la inicialización, actualización y manejo de eventos.

---

## Funciones y metodos

### InitNormalMode

### 


