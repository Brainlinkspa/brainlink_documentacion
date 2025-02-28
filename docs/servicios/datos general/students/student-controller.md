---
title: Student-Controller
sidebar_label: StudentController
---

El controlador StudentsController es responsable de manejar las operaciones CRUD (Crear, Leer, Actualizar, Eliminar) relacionadas con los estudiantes. A continuación, se describe cada uno de los endpoints disponibles, junto con sus parámetros, roles permitidos y respuestas esperadas.

## 1. Crear un Estudiante
Este endpoint permite crear un nuevo estudiante en el sistema. Verifica si el correo ya está registrado y valida el rol del creador antes de proceder.

| Método | Endpoint         | Descripción                              |
|--------|------------------|------------------------------------------|
| POST   | /students/create | Crea un nuevo estudiante en el sistema. |

#### Parámetros del cuerpo (Body)
```json
{
  "studentName": "Nombre del estudiante",
  "rut": "RUT del estudiante",
  "email": "Correo electrónico del estudiante",
  "password": "Contraseña del estudiante",
  "creatorId": "ID del creador (profesor o establecimiento)",
  "courseId": "ID del curso",
  "creatorRolId": 1 // Rol del creador (1: admin, 2: profesor)
}
```

Respuestas
Éxito : `{ message: 'Estudiante creado con éxito', studentId }`
Error : `{ error: 'Mensaje de error' }`


### 2. Actualizar un Estudiante
Este endpoint permite actualizar la información de un estudiante existente. Solo los administradores o profesores pueden realizar esta operación.

| Método | Endpoint         | Descripción                              |
|--------|------------------|------------------------------------------|
| POST   | /students/update | Actualiza la información de un estudiante. |

#### Parámetros del cuerpo (Body)
```json
{
  "studentId": "ID del estudiante",
  "creatorRolId": 2, // Rol del creador (1: admin, 2: profesor)
  "newStudentName": "Nuevo nombre del estudiante (opcional)",
  "newRut": "Nuevo RUT del estudiante (opcional)",
  "newEmail": "Nuevo correo electrónico del estudiante (opcional)",
  "newPassword": "Nueva contraseña del estudiante (opcional)"
}
```

Respuestas
Exito : `{ message: 'Estudiante actualizado con éxito', student: updatedStudent }`
Error : `{ error: 'Mensaje de error' }`


### 3. Eliminar un Estudiante
Este endpoint permite eliminar un estudiante del sistema. Solo los administradores o profesores pueden realizar esta operación.

| Método | Endpoint         | Descripción                              |
|--------|------------------|------------------------------------------|
| DELETE | /students/delete | Elimina un estudiante del sistema. |


#### Parámetros del cuerpo (Body)
```json
{
  "studentId": "ID del estudiante",
  "creatorRolId": 1 // Rol del creador (1: admin, 2: profesor)
}
```

Respuestas
Éxito : `{ message: 'Estudiante eliminado con éxito' }`
Error : `{ error: 'Mensaje de error' }`



### 4. Listar Estudiantes por RBD
Este endpoint permite listar todos los estudiantes asociados a un RBD específico. El RBD se obtiene según el creador (profesor o establecimiento).


| Método | Endpoint             | Descripción                              |
|--------|----------------------|------------------------------------------|
| GET    | /students/list-by-rbd | Lista los estudiantes asociados a un RBD. |


#### Parámetros del cuerpo (Body)
```json
{
  "creatorId": "ID del creador (profesor o establecimiento)",
  "creatorRolId": 1 // Rol del creador (1: admin/establecimiento, 2: profesor)
}
```

Respuestas
Éxito : `{ message: 'Estudiantes obtenidos con éxito', students }`
Error : `{ error: 'Mensaje de error' }`

## Consideraciones Importantes

1. **Integridad de la Base de Datos**:
   - Se verifica que el correo electrónico no esté duplicado antes de crear un estudiante.
   - Solo los roles permitidos (administradores o profesores) pueden realizar operaciones en el sistema.
   - Los estudiantes están asociados a un RBD, lo que garantiza que los datos estén organizados por establecimiento educativo.

2. **Manejo de Errores**:
   - Todos los endpoints incluyen un manejo de errores robusto que devuelve mensajes claros en caso de fallo.

3. **Seguridad**:
   - Se utiliza verificación de roles para garantizar que solo usuarios autorizados puedan realizar ciertas acciones.