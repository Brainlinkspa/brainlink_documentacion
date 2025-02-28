---
title: Teacher-Controller
sidebar_label: TeacherController
---

El controlador `TeachersController` es responsable de manejar las operaciones CRUD (Crear, Leer, Actualizar, Eliminar) relacionadas con los profesores en el sistema. Este controlador utiliza servicios como `TeachersService` y `EstablishmentsService` para interactuar con la base de datos y garantizar la integridad de los datos. Además, realiza validaciones adicionales para asegurar que solo usuarios autorizados puedan realizar ciertas acciones.

## Funcionamiento General
El controlador sigue un flujo estructurado para cada operación:

1. Validación de Datos: Verifica que los datos proporcionados sean correctos y cumplan con las reglas del negocio.
2. Verificación de Roles: Asegura que solo los usuarios con roles adecuados (por ejemplo, administradores) puedan realizar ciertas acciones.
3. Integridad de la Base de Datos: Utiliza servicios específicos para interactuar con la base de datos y mantener la consistencia de los datos.
4. Manejo de Errores: Captura y maneja errores para proporcionar respuestas claras al cliente.

## 1. Crear un Profesor
Este endpoint permite crear un nuevo profesor en el sistema. Realiza varias validaciones para garantizar que los datos sean únicos y válidos.

| Método | Endpoint         | Descripción                              |
|--------|------------------|------------------------------------------|
| POST   | /teachers/create | Crea un nuevo profesor en el sistema.    |

Parámetros del cuerpo (Body)

```json
{
  "teacherName": "Nombre del profesor",
  "departmentId": 1,
  "rut": "RUT del profesor",
  "email": "Correo electrónico del profesor",
  "password": "Contraseña del profesor",
  "rbd": "Registro de Base de Datos",
  "userRolId": 1 // Rol del usuario (1: admin)
}
```

Respuestas

Éxito: `{ message: 'Profesor creado con éxito', teacherId }`
Error: `{ error: 'Mensaje de error' }`

## 2. Actualizar un Profesor

| Método | Endpoint          | Descripción                              |
|--------|------------------|------------------------------------------|
| POST   | /teachers/update | Actualiza los datos de un profesor.      |

Parámetros del cuerpo (Body)

```json
{
  "teacherId": "ID del profesor",
  "newTeacherName": "Nuevo nombre del profesor",
  "newDepartmentId": 2,
  "newRut": "Nuevo RUT del profesor",
  "newEmail": "Nuevo correo electrónico del profesor",
  "newPassword": "Nueva contraseña del profesor",
  "rbd": "Registro de Base de Datos",
  "userRolId": 1 // Rol del usuario (1: admin)
}
```

Respuestas

Éxito: `{ message: 'Profesor actualizado con éxito', teacher: updatedTeacher }`
Error: `{ error: 'Mensaje de error' }`

## 3. Eliminar un Profesor
Este endpoint permite eliminar un profesor existente del sistema.

| Método | Endpoint         | Descripción                              |
|--------|------------------|------------------------------------------|
| DELETE | /teachers/delete | Elimina un profesor del sistema.         |

Parámetros del cuerpo (Body)

```json
{
  "teacherId": "ID del profesor",
  "rbd": "Registro de Base de Datos",
  "userRolId": 1 // Rol del usuario (1: admin)
}
```

Respuestas

Éxito: `{ message: 'Profesor eliminado con éxito' }`
Error: `{ error: 'Mensaje de error' }`

## 4. Listar Profesores por RBD
Este endpoint permite listar todos los profesores asociados a un RBD específico.

| Método | Endpoint             | Descripción                               |
|--------|----------------------|------------------------------------------|
| GET    | /teachers/list-by-rbd | Lista los profesores asociados a un RBD. |

Parámetros del cuerpo (Body)

```json
{
  "creatorId": "ID del creador (profesor o establecimiento)",
  "creatorRolId": 1 // Rol del creador (1: admin)
}
```

Respuestas

Éxito: `{ message: 'Profesores obtenidos con éxito', teachers }`
Error: `{ error: 'Mensaje de error' }`

## Consideraciones: 

Encontre un pequeño error logico que por temas de tiempo no pude arreglar, hay que cambiar el eliminar de los profesores, esto debido a que al eliminarse se elimina tambien todo lo relacionado al curso que el profesor tiene a cargo, aconsejo modificar levemente las tablas relacionales de la base de datos ademas de el controlador y el servicio de los profesores, de momento no encontre otra observacion.