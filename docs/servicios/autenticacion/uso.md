---
id: Uso
title: Uso de Api
description: Explicación y rutas del controlador de autenticación con ejemplos y manejo de errores.
---

# Controladores de AuthController

El `AuthController` es el encargado de manejar las rutas relacionadas con la autenticación de usuarios. Implementa funcionalidades como inicio de sesión y verificación de tokens JWT.

---

## Rutas Disponibles

### **POST `/auth/login`**

Realiza el inicio de sesión del usuario, valida las credenciales y genera un token JWT.

#### **Cuerpo de la Solicitud**


```json
{
  "email": "usuario@example.com",
  "password": "contraseña123"
}
```
Desarrollar que responde.
###