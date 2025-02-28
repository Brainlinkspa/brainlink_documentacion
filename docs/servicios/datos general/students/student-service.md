---
title: Student-Service
sidebar_label: StudentService
---

El servicio StudentsService es responsable de manejar todas las operaciones relacionadas con los estudiantes en el sistema. A continuación, se detallan las principales funcionalidades del servicio.

## Funcionalidades Principales
## 1. Crear un Estudiante
Este método permite crear un nuevo estudiante en el sistema. Realiza varias validaciones y operaciones en diferentes bases de datos para garantizar la integridad de los datos.

## Pasos realizados:

1. Verificar si el RUT ya existe en la base de datos general.
2. Verificar si el correo electrónico ya está registrado en la base de autenticación.
3. Obtener el RBD (código del establecimiento) según el creador.
4. Crear el estudiante en la base de datos general.
5. Asociar el estudiante con un curso.
6. Asociar el estudiante con un establecimiento.
7. Crear el usuario en la base de autenticación.

```typescript
-- Ejemplo de consultas SQL utilizadas
SELECT EXISTS(SELECT 1 FROM students WHERE rut = $1);
INSERT INTO students (studentname, rut) VALUES ($1, $2) RETURNING studentid;
INSERT INTO Student_Course (StudentID, CourseID) VALUES ($1, $2);
INSERT INTO Establishment_Student (RBD, StudentID) VALUES ($1, $2);
```

## 2. Actualizar un Estudiante
Este método permite actualizar la información de un estudiante existente. Los campos que se pueden actualizar incluyen el nombre, RUT, correo electrónico y contraseña.

Pasos realizados:

Construir una consulta dinámica para actualizar solo los campos proporcionados.
Actualizar los datos en la base de autenticación si se proporcionan nuevos valores de correo o contraseña.

```typescript
-- Ejemplo de consulta SQL utilizada
UPDATE students SET studentname = $1, rut = $2 WHERE studentid = $3 RETURNING *;
```

## 3. Eliminar un Estudiante
Este método elimina un estudiante del sistema. Realiza las siguientes operaciones:

1. Eliminar la relación con el establecimiento.
2. Eliminar la relación con el curso.
3. Eliminar el usuario en la base de autenticación.
4. Eliminar el estudiante de la base de datos general.

```typescript
-- Ejemplo de consultas SQL utilizadas
DELETE FROM Establishment_Student WHERE StudentID = $1;
DELETE FROM Student_Course WHERE StudentID = $1;
DELETE FROM students WHERE studentid = $1;
```

## 4. Obtener RBD por Creador
Este método obtiene el RBD (código del establecimiento) según el creador (profesor o administrador).

```typescript
-- Ejemplo de consulta SQL utilizada
SELECT RBD FROM Teacher_Establishment WHERE TeacherID = $1;
```

## 5. Obtener Estudiantes por RBD
Este método recupera todos los estudiantes asociados a un RBD específico, junto con sus cursos y correos electrónicos.

```typescript
-- Ejemplo de consulta SQL utilizada
SELECT s.studentid, s.studentname, s.rut, c.courseid
FROM Establishment_Student es
JOIN Students s ON es.StudentID = s.studentid
LEFT JOIN Student_Course sc ON s.studentid = sc.StudentID
LEFT JOIN Courses c ON sc.CourseID = c.CourseID
WHERE es.RBD = $1;
```

## Consideraciones Adicionales
Integridad de Datos: Todas las operaciones incluyen validaciones para garantizar que no se creen duplicados ni se violen las restricciones de la base de datos.
Manejo de Errores: Se implementa un manejo robusto de errores para revertir cambios en caso de fallos durante cualquier operación.
Comunicación con Backend Externo: Se utiliza Axios para interactuar con un backend externo de autenticación.