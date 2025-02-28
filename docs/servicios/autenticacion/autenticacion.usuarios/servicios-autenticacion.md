---
id: auth-service
title: AuthService
sidebar_label: AuthService
---

# AuthService

El servicio `AuthService` es una clase inyectable en una aplicación NestJS que maneja la autenticación de usuarios. Proporciona métodos para validar credenciales, verificar tokens JWT, gestionar cookies y realizar consultas a una base de datos PostgreSQL.

## Descripción General

Este servicio utiliza las siguientes dependencias:
- **`@nestjs/common`**: Para definir el servicio como inyectable.
- **`pg`**: Para interactuar con una base de datos PostgreSQL.
- **`bcrypt`**: Para comparar contraseñas de forma segura.
- **`jsonwebtoken`**: Para generar y verificar tokens JWT.
- **`express`**: Para manejar cookies en las respuestas HTTP.

## Constructor

El constructor inicializa una conexión a la base de datos PostgreSQL utilizando el paquete `pg`. La configuración de la base de datos se realiza mediante variables de entorno:

```typescript
this.pool = new Pool({
  host: process.env.DB_HOST,
  port: parseInt(process.env.DB_PORT, 10),
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
});
```

## Métodos Principales
## 1. `validateUser(email: string, password: string): Promise<any>`
Valida las credenciales de un usuario comparando el correo electrónico y la contraseña con los datos almacenados en la base de datos.

## Parámetros :
`email`: Correo electrónico del usuario.
`password`: Contraseña proporcionada por el usuario.
## Retorna :
Un objeto con el ID y el rol del usuario si las credenciales son válidas.
`null` si las credenciales no coinciden.

## 2. `checkEmailExists(email: string): Promise<boolean>`
Verifica si un correo electrónico ya existe en la base de datos.

## Parámetros :
`email`: Correo electrónico a verificar.
## Retorna :
`true` si el correo existe.
`false` si el correo no existe.

## 3. `generateToken(userId: string, rolId: number): string`
Genera un token JWT para el usuario autenticado.

Parámetros :
`userId`: ID del usuario.
`rolId`: ID del rol del usuario.
Retorna :
Un token JWT firmado con una clave secreta.
Configuración del payload :

```typescript
const payload = {
  id: userId,
  rolId: rolId,
};
```

## 4. `verifyToken(token: string): Promise<any>`
Verifica la validez de un token JWT.

## Parámetros :
token: Token JWT a verificar.
## Retorna :
El payload decodificado si el token es válido.
`null` si el token es inválido o ha expirado.

## 5. `addTokenToCookies(res: Response, token: string): void`
Agrega un token JWT a las cookies de la respuesta HTTP.

## Parámetros :
`res`: Objeto de respuesta HTTP.
`token`: Token JWT a agregar.

## Configuración de las cookies :

```typescript
res.cookie('auth_token', token, {
  httpOnly: true,
  secure: process.env.NODE_ENV === 'true',
  sameSite: 'lax',
  maxAge: 3600000, // 1 hora
});
```

## 6. `getTokenFromCookies(req: any): string | null`
Obtiene el token JWT almacenado en las cookies de la solicitud HTTP.

## Parámetros :
`req`: Objeto de solicitud HTTP.
## Retorna :
El token JWT si está presente.
`null` si no hay token.

## 7. `removeTokenFromCookies(res: Response): void`
Elimina el token JWT de las cookies de la respuesta HTTP.

## Parámetros :
`res`: Objeto de respuesta HTTP.

## Métodos Auxiliares
`getCurrentUser(): any`
Retorna el usuario actual almacenado en memoria.

`clearCurrentUser(): void`
Limpia el usuario actual almacenado en memoria.

## Manejo de Errores
El servicio incluye manejo de errores para:

Conexiones fallidas a la base de datos.
Consultas SQL fallidas.
Verificación de tokens JWT inválidos.
Ejemplo de manejo de errores :

```typescript
try {
  const result = await this.pool.query(query, values);
  return result.rows.length > 0;
} catch (error) {
  console.error('Error al verificar el correo en la base de datos:', error);
  throw new Error('Error al verificar el correo');
}
```