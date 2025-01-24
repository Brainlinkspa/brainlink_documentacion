---
id: auth-service
title: Servicio de Autenticación (AuthService)
description: Explicación general del servicio de autenticación con ejemplos.
sidebar_position: 3
---

# Servicio de Autenticación (AuthService)

El servicio de autenticación es responsable de manejar la validación de usuarios, generación y verificación de tokens JWT, así como el manejo de cookies para mantener sesiones activas.

## Conceptos Clave

1. **Validación de Usuarios:**
   - Comprobar si el email y contraseña proporcionados son correctos.
   - Buscar en la base de datos al usuario correspondiente.
   - Comparar la contraseña ingresada con la almacenada.

2. **Generación de Tokens JWT:**
   - Crear un token único para el usuario autenticado, que incluye datos como `email` y `rol`.
   - Configurar un tiempo de expiración para mayor seguridad.

3. **Manejo de Cookies:**
   - Almacenar el token JWT en cookies HTTP para mantener sesiones.
   - Recuperar y verificar el token de las cookies en solicitudes posteriores.

4. **Cierre de Sesión:**
   - Eliminar la información del usuario autenticado para finalizar la sesión.

---

## Ejemplo de Implementación

```typescript
// Clase AuthService para manejo de autenticación
class AuthService {
  constructor() {
    // Configurar conexión a una base de datos (ejemplo: PostgreSQL)
  }

  // Validar credenciales: ¿es este email y contraseña válidos?
  async validateUser(email: string, password: string): Promise<any> {
    // 1. Buscar al usuario por email.
    // 2. Comparar contraseñas (hashed en la base de datos).
    // Retornar el usuario autenticado si las credenciales coinciden.
  }

  // Generar token JWT para el usuario autenticado.
  generateToken(user: any): string {
    // Crear un token con la información del usuario (ejemplo: email, rol).
    // Configurar una clave secreta y tiempo de expiración (ejemplo: 1 hora).
  }

  // Verificar la validez de un token JWT.
  async verifyToken(token: string): Promise<any> {
    // Verificar si el token proporcionado es válido y no ha expirado.
  }

  // Métodos para manejar cookies con el token:
  addTokenToCookies(res: Response, token: string): void {
    // Agregar el token a las cookies HTTP.
  }

  getTokenFromCookies(req: any): string | null {
    // Recuperar el token de las cookies de una solicitud HTTP.
  }

  // Métodos auxiliares:
  getCurrentUser(): any {
    // Retornar el usuario autenticado actual.
  }

  clearCurrentUser(): void {
    // Limpiar la información del usuario autenticado (cerrar sesión).
  }
}

// Ejemplo de uso general:
const authService = new AuthService();
const email = 'usuario@example.com';
const password = 'contraseña123';

// Validar usuario:
authService.validateUser(email, password).then((user) => {
  if (user) {
    const token = authService.generateToken(user); // Crear token para el usuario autenticado.
    console.log('Token generado:', token);
  } else {
    console.log('Credenciales inválidas.');
  }
});