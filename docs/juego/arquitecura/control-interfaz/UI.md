---
    sidebar_position: 4
---

# UI

## Descripción
```csharp
public abstract class UI 
```
La clase abstracta `UI` sirve como una clase base para la creación de interfaces de usuario dentro del sistema. Está diseñada para ser extendida por otras clases que representarán diferentes tipos de interfaces de usuario en el juego o aplicación. 

Su propósito principal es proporcionar una estructura común para las interfaces de usuario, permitiendo la inicialización y la gestión de la interacción con los elementos visuales del juego.

---

## Funciones y Métodos

### **Init**
```csharp
public abstract void Init(object attributes);
```
Este método es abstracto y debe ser implementado por las clases derivadas. Su propósito es inicializar la interfaz de usuario con los atributos proporcionados, asegurándose de que la interfaz esté configurada correctamente para la ejecución.

---

### **InitInstance**
```csharp
public abstract void InitInstance(GameObject ui);
```
Este método también es abstracto y se debe implementar en las clases derivadas. Su función es inicializar la instancia de la interfaz de usuario utilizando un objeto `GameObject` que representa la UI en la escena.

---

### **SetOpen**
```csharp
public virtual void SetOpen<T>(T additionalData = null) where T : class
```
Este método es virtual y proporciona una funcionalidad predeterminada que puede ser sobrescrita en las clases derivadas. Su propósito es permitir la apertura de la interfaz de usuario, y puede recibir datos adicionales como parámetros si es necesario, aunque de forma predeterminada no realiza ninguna acción.
