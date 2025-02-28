---
id: users-service
title: Users Service
---

# Users Service

El servicio `UsersService` es una clase inyectable en NestJS que maneja operaciones relacionadas con los usuarios en una aplicación. Utiliza PostgreSQL como base de datos y proporciona métodos para crear, actualizar, eliminar y gestionar usuarios.

## Configuración inicial


El servicio utiliza el módulo `pg.Pool` para conectarse a una base de datos PostgreSQL. La conexión se configura en el constructor utilizando variables de entorno:

- `DB_HOST`: Host de la base de datos.
- `DB_PORT`: Puerto de la base de datos.
- `DB_USER`: Usuario de la base de datos.
- `DB_PASSWORD`: Contraseña de la base de datos.
- `DB_NAME`: Nombre de la base de datos.

```typescript
constructor() {
  this.pool = new Pool({
    host: process.env.DB_HOST,
    port: parseInt(process.env.DB_PORT, 10),
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
  });
}
```
## 1. Crear un usuario (`createUser`)
Este método permite crear un nuevo usuario en la base de datos. La contraseña del usuario se encripta utilizando bcrypt.

Parámetros:

- `userId` (string): ID único del usuario.
- `email` (string): Correo electrónico del usuario.
- `password` (string): Contraseña del usuario.
- `rolId` (number): ID del rol del usuario.

```typescript
await usersService.createUser('12345', 'user@example.com', 'securePassword123', 2);
```

## 2. Crear un administrador si no existe (`createAdminIfNotExist`)
Este método verifica si existe un usuario administrador en la base de datos. Si no existe, crea uno utilizando las credenciales definidas en las variables de entorno (ADMIN_EMAIL y ADMIN_PASSWORD).

```typescript
await usersService.createAdminIfNotExist();
```

## 3. Eliminar un usuario (`deleteUser`)
Este método elimina un usuario de la base de datos utilizando su ID.

Parámetros:

`userId` (string): ID del usuario a eliminar.

Ejemplo de uso:

```typescript
await usersService.deleteUser('12345');
```

## 4. Actualizar un usuario (`updateUser`)
Este método permite actualizar el correo electrónico y/o la contraseña de un usuario existente.

Parámetros:

`userId` (string): ID del usuario a actualizar.
`email` (string, opcional): Nuevo correo electrónico.
`password` (string, opcional): Nueva contraseña.

Ejemplo de uso:

```typescript
await usersService.updateUser('12345', 'new.email@example.com', 'newSecurePassword123');
```

## 5. Actualizar un establecimiento (updateEstablishment)
Este método actualiza dinámicamente los campos de un usuario/establecimiento según los parámetros proporcionados.

Parámetros:

`id` (string): ID del usuario/establecimiento a actualizar.
`newId` (string, opcional): Nuevo ID.
`newEmail` (string, opcional): Nuevo correo electrónico.
`newPassword` (string, opcional): Nueva contraseña.

Ejemplo de uso:

```typescript
await usersService.updateEstablishment('12345', 'newId123', 'new.email@example.com', 'newSecurePassword123');
```

## 6. Eliminación masiva de usuarios (batchDeleteUsers)
Este método elimina varios usuarios de la base de datos en una sola operación.

Parámetros:

`userIds` (string[]): Lista de IDs de los usuarios a eliminar.

Ejemplo de uso:

```typescript
await usersService.batchDeleteUsers(['12345', '67890']);
```

## Manejo de errores
Todos los métodos incluyen manejo de errores básico. Si ocurre un error durante la ejecución de una operación, se lanzará una excepción con un mensaje descriptivo.

Ejemplo de manejo de errores:

```typescript
try {
  await usersService.createUser('12345', 'user@example.com', 'securePassword123', 2);
} catch (error) {
  console.error('Error al crear el usuario:', error.message);
}
```

## Notas adicionales
Encriptación de contraseñas: Todas las contraseñas se encriptan utilizando bcrypt con un costo de hash de 10.
Validación de entrada: Algunos métodos realizan validaciones básicas para asegurarse de que se proporcionen datos válidos antes de realizar operaciones en la base de datos.