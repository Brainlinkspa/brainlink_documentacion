---
title: Teacher-Service
sidebar_label: TeacherService
---

El servicio TeachersService es una parte fundamental del sistema que gestiona la creación, actualización, eliminación y consulta de profesores dentro de una institución educativa. Este servicio actúa como intermediario entre la base de datos principal y un backend externo dedicado a la autenticación de usuarios.

## Propósito
El propósito principal de este servicio es:

1. Gestionar profesores : Crear, actualizar y eliminar registros de profesores en la base de datos.
2. Mantener relaciones : Asociar profesores con departamentos y establecimientos educativos.
3. Integración con autenticación : Sincronizar los datos de los profesores con un backend externo para manejar credenciales de usuario (correo electrónico y contraseña).

## Arquitectura
El servicio utiliza las siguientes capas:

Base de datos principal : Almacena información sobre los profesores, departamentos y establecimientos.
Backend externo de autenticación : Gestiona la creación, actualización y eliminación de usuarios en un sistema separado.
API RESTful : Expone endpoints para interactuar con el servicio desde otras partes del sistema.

## Funcionalidades Principales
1. Crear un Profesor

```typescript
const teacherId = await teachersService.createTeacher(
  "Juan Pérez",
  1,
  "12345678-9",
  "juan.perez@example.com",
  "securepassword123",
  "12345"
);
console.log(`Profesor creado con ID: ${teacherId}`);
```

## Descripción
Este método permite registrar un nuevo profesor en el sistema. Además de almacenar los datos básicos del profesor, también asocia al profesor con un departamento y un establecimiento educativo, y crea un usuario en el backend de autenticación.

Parámetros
`teacherName`: Nombre del profesor.
`departmentId`: ID del departamento al que pertenece el profesor.
`rut`: Identificador único del profesor.
`email`: Correo electrónico del profesor.
`password`: Contraseña del profesor.
`rbd`: Código del establecimiento educativo.

### Proceso
1. Verifica si el profesor ya está asociado al establecimiento.
2. Crea un registro del profesor en la base de datos principal.
3. Asocia al profesor con el departamento y el establecimiento.
4. Crea un usuario en el backend de autenticación.

Respuesta
Retorna el ID del profesor creado.

## 2. Actualizar un Profesor
Descripción
Este método permite modificar los datos de un profesor existente. Se pueden actualizar campos como el nombre, el departamento, el RUT, el correo electrónico y la contraseña.

```typescript
const updatedTeacher = await teachersService.updateTeacher(
  "123e4567-e89b-12d3-a456-426614174000",
  "Juan Pérez López",
  2
);
console.log(`Profesor actualizado:`, updatedTeacher);
```

Parámetros
`teacherId`: ID del profesor a actualizar.
`newTeacherName` (opcional): Nuevo nombre del profesor.
`newDepartmentId` (opcional): Nuevo ID del departamento.
`newRut` (opcional): Nuevo RUT del profesor.
`newEmail` (opcional): Nuevo correo electrónico.
`newPassword` (opcional): Nueva contraseña.

## Proceso
1. Actualiza los campos proporcionados en la base de datos principal.
2. Si se cambia el departamento, actualiza la relación correspondiente.
3. Si se proporcionan nuevos valores de correo o contraseña, sincroniza los cambios con el backend de autenticación.
Respuesta
Retorna los datos actualizados del profesor.

## 3. Eliminar un Profesor
Descripción
Este método elimina un profesor del sistema, incluyendo sus relaciones con departamentos y establecimientos, así como su usuario en el backend de autenticación.

```typescript
await teachersService.deleteTeacher("123e4567-e89b-12d3-a456-426614174000");
console.log("Profesor eliminado correctamente");
```

### Parámetros

`teacherId`: ID del profesor a eliminar.

## Proceso

1. Elimina la relación del profesor con el establecimiento.
2. Elimina la relación del profesor con el departamento.
3. Elimina el usuario en el backend de autenticación.
4. Elimina el registro del profesor en la base de datos principal.

Respuesta
No retorna datos adicionales.

## 4. Obtener Profesores por Establecimiento
Descripción
Este método recupera una lista de profesores asociados a un establecimiento específico, incluyendo sus correos electrónicos.

Parámetros
`rbd`: Código del establecimiento educativo.
Proceso
1. Consulta los profesores asociados al establecimiento en la base de datos principal.
2. Recupera los correos electrónicos de los profesores desde el backend de autenticación.
3. Combina los datos para formatear la respuesta.

Respuesta
Retorna una lista de profesores con sus nombres, RUTs y correos electrónicos.

Consideraciones de Seguridad
1. Autenticación : El servicio depende de un backend externo para manejar credenciales de usuario, lo que reduce el riesgo de exposición de contraseñas en la base de datos principal.
2. Validaciones : Se realizan validaciones para evitar duplicados y garantizar la integridad de los datos.
3. Errores controlados : Los errores son manejados de manera adecuada, proporcionando mensajes claros sin exponer detalles sensible