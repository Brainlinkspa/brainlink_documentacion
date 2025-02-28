---
title: Auth-Controller
sidebar_label: AuthController
---

El archivo `auth.controller.ts` es un controlador en NestJS que maneja las operaciones relacionadas con la autenticación de usuarios. Este controlador define endpoints para gestionar el inicio de sesión (`login`), la verificación del token (`verify-token`), el cierre de sesión (`logout`) y la verificación de la existencia de un correo electrónico (`check-email`).

## Importaciones

```typescript
import { Controller, Post, Body, HttpCode, HttpStatus, Res, Req } from '@nestjs/common';
import { AuthService } from './auth.service';
import { Response, Request } from 'express';
```

@nestjs/common : Proporciona decoradores como `@Controller`, `@Post`, `@Body`, etc., para definir rutas y manejar solicitudes HTTP.
AuthService : Un servicio personalizado que encapsula la lógica de negocio relacionada con la autenticación.
Response y Request : Tipos de Express para manejar respuestas y solicitudes HTTP.

## Controlador: `AuthController`

```typescript
@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}
}
```

El controlador está registrado bajo la ruta base `/auth`. Utiliza el servicio `AuthService` para realizar operaciones como la validación de usuarios, generación de tokens y manejo de cookies.

## Endpoint: `POST /auth/login`
Este endpoint permite a los usuarios iniciar sesión proporcionando su correo electrónico y contraseña.

Parámetros de entrada
email : Correo electrónico del usuario.
password : Contraseña del usuario.
Flujo de ejecución
## 1. Validación del usuario :
Se utiliza el método `validateUser` del servicio `AuthService` para verificar las credenciales.
Si las credenciales son inválidas, se devuelve un error con el código `401 Unauthorized`.
## 2. Generación del token :
Si el usuario es válido, se genera un token JWT utilizando el método `generateToken` del servicio `AuthService`.
El token se almacena en las cookies mediante el método `addTokenToCookies`.
## 3 Redirección :
Se obtiene el valor del encabezado `x-id` para determinar la URL de redirección.
Por defecto, los usuarios son redirigidos a `http://localhost:4000/pages?id=docentes`.
## 4 Respuesta :
Devuelve un mensaje de éxito y la URL de redirección.
Ejemplo de respuesta

```typescript
{
  "message": "Login exitoso",
  "redirectUrl": "http://localhost:4000/pages?id=docentes"
}
```

## Endpoint: `POST /auth/verify-token`
Este endpoint verifica la validez del token almacenado en las cookies del usuario.

## Flujo de ejecución
## 1 Obtención del token :
Se extrae el token de las cookies utilizando el método `getTokenFromCookies`.
## 2 Verificación del token :
Se verifica la validez del token utilizando el método `verifyToken` del servicio `AuthService`.
Si el token no es válido o ha expirado, se devuelve un error con el código `403 Forbidden`.
## 3 Respuesta :
Si el token es válido, se devuelve el ID y el rol del usuario.
Ejemplo de respuesta

```typescript
{
  "message": "Token válido",
  "statusCode": 200,
  "user": {
    "id": "123",
    "rol_id": "1"
  }
}
```

Endpoint: POST /auth/logout
Este endpoint permite a los usuarios cerrar sesión eliminando el token de las cookies.

Respuesta

```typescript
{
  "message": "Logout exitoso",
  "statusCode": 200
}
```

## Endpoint: POST /auth/check-email
Este endpoint verifica si un correo electrónico ya existe en la base de datos.

## Parámetros de entrada
email : Correo electrónico a verificar.
## Respuesta
Si el correo existe, devuelve ```typescript{ exists: true }```.
Si el correo no existe, devuelve ```typescript{ exists: false }```.
Manejo de errores
En caso de error durante la verificación, se registra el error en la consola y se devuelve:

```typescript
{
  "error": "Error al verificar el correo"
}
```

Consideraciones adicionales
## 1 Seguridad :
Los tokens JWT se utilizan para garantizar la autenticación segura.
Las cookies se utilizan para almacenar el token, lo que puede mejorar la seguridad si se configuran correctamente (por ejemplo, con la opción HttpOnly).
## 2 Manejo de errores :
Cada endpoint incluye un manejo adecuado de errores para garantizar que los clientes reciban respuestas claras y consistentes.
## 3 Redirecciones :
El sistema de redirecciones se basa en el encabezado x-id, lo que permite una personalización flexible según el contexto del cliente.