---
title: Establishment-Service
sidebar_label: EstablishmentService
---

El servicio EstablishmentsService es responsable de gestionar las operaciones relacionadas con los establecimientos en el sistema. A continuación, se detallan las principales funcionalidades implementadas en este servicio.

## Crear un Establecimiento
Este método permite crear un nuevo establecimiento en la base de datos principal y registrar un usuario administrador en la base de datos de autenticación.

### Flujo de Datos
1. Inserción en la Base de Datos Principal :
Se inserta un nuevo registro en la tabla `establishments` con los datos proporcionados.
Ejemplo de consulta SQL

```typescript
INSERT INTO establishments (rbd, establishmentsName, establishmentLocation, contact, address)
VALUES ($1, $2, $3, $4, $5);
```

2. Creación del Usuario Administrador :
Se realiza una solicitud HTTP POST al backend externo para crear un usuario administrador.
Ejemplo de datos enviados:

```typescript
{
  "userId": "12345",
  "email": "admin@example.com",
  "password": "securePassword123",
  "rol_id": 1
}
```

Manejo de Errores
Si ocurre un error durante la inserción en la base de datos o la comunicación con el backend externo, se lanza una excepción con un mensaje descriptivo.

## Eliminar un Establecimiento
Este método elimina un establecimiento por su RBD, junto con todos los usuarios asociados (profesores, estudiantes y administradores).

### Flujo de Datos
1. Obtención de IDs Asociados :
Se obtienen los IDs de profesores y estudiantes asociados al establecimiento mediante consultas SQL

```typescript
SELECT TeacherID FROM Teacher_Establishment WHERE RBD = $1;
SELECT StudentID FROM Establishment_Student WHERE RBD = $1;
```

2. Eliminación en la Base de Datos de Autenticación :
Se eliminan los usuarios asociados en el backend externo mediante una solicitud HTTP POST:

```typescript
{
  "userIds": ["teacher1", "student1", "student2"]
}
```

3. Eliminación en la Base de Datos Principal :
Se eliminan los registros relacionados en las tablas `Teachers`, `Students` y `Establishments`:

```typescript
DELETE FROM Teachers WHERE teacherid IN (SELECT TeacherID FROM Teacher_Establishment WHERE RBD = $1);
DELETE FROM Students WHERE studentid IN (SELECT StudentID FROM Establishment_Student WHERE RBD = $1);
DELETE FROM Establishments WHERE RBD = $1;
```

Manejo de Errores
Si ocurre un error en cualquiera de los pasos, se registra el error y se lanza una excepción.

## Actualizar un Establecimiento
Este método permite actualizar los datos de un establecimiento existente, incluyendo la actualización del usuario administrador en la base de datos de autenticación.

### Flujo de Datos
1. Actualización en la Base de Datos Principal :
Se construye dinámicamente una consulta SQL para actualizar solo los campos proporcionados:

```typescript
UPDATE establishments
SET establishmentsname = $1, establishmentlocation = $2
WHERE rbd = $3 RETURNING *;
```

2. Actualización en la Base de Datos de Autenticación :
Si se proporciona un nuevo RBD, se actualiza el usuario administrador en el backend externo

```typescript
{
  "id": "oldRbd",
  "newId": "newRbd",
  "newEmail": "newAdmin@example.com",
  "newPassword": "newSecurePassword123"
}
```

Manejo de Errores
Si no se proporcionan datos para actualizar, se lanza una excepción indicando que no hay cambios disponibles.

## Verificar un RBD
Este método verifica si un RBD existe en la base de datos.

### Flujo de Datos
1. Consulta en la Base de Datos Principal :
Se ejecuta una consulta para contar los registros con el RBD proporcionado

```typescript
SELECT COUNT(*) AS count
FROM establishments
WHERE rbd = $1;
```

2. Resultado :
Retorna true si el RBD existe, false en caso contrario.

Manejo de Errores
Si ocurre un error durante la consulta, se registra el error y se lanza una excepción.