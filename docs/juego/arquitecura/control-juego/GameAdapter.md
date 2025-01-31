---
    sidebar_position: 1
---

# GameAdapter

## Descripción
```csharp
public class GameAdapter<TMode, TAttributes>
```
La clase `GameAdapter` es un adaptador genérico diseñado para gestionar el instanciado e inicialización de diferentes modos de juego. Esta clase permite iniciar un modo de juego cualquiera, actualizar su estado durante la ejecución y finalizarlo cuando sea necesario. 

Utiliza los tipos genéricos `TMode` y `TAttributes` para ofrecer flexibilidad, lo que permite recibir distintos tipos de modos de juego y sus configuraciones de manera independiente. Esto complementado con el patrón de diseño Adapter facilita la integración y administración de múltiples modos de juego sin necesidad de reescribir la lógica para administrarlos en otras clases.

---
## Funciones y métodos

### SetGameMode
```csharp
public void SetGameMode(TAttributes attributes)
```

Prepara e inicializa una instancia de un modo de juego, recibe por parámetros sus atributos `<TAttributes>` y llama al método `StartMode()`. Cuenta tambien con un check de seguridad para finalizar la instancia de un juego anterior en caso de que aún este activo. 

### EndCurrentMode
```csharp
public void EndCurrentMode()
```

Finaliza la instancia de un modo de juego llamando a su metodo `EndMode()`

### UpdateCurrentMode
```csharp
public void UpdateCurrentMode()
```

Actualiza la instancia de un modo de juego llamando a su metodo `UpdateMode()`

---

## Ejemplos

A continuación se proporcionaran ejemplos de uso referente a otras clases.

```csharp
//Instanciado de variable en clase externa
GameAdapter<NormalMode, NormalModeAttributes> normalMode

//Inicialización
normalMode.SetGameMode(NormalModeAttributes);
```

