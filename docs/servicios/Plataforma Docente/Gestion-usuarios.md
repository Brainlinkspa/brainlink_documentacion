# Gestión de Usuarios

Permite gestionar usuarios en la plataforma de manera eficiente.

## Criterios de Aceptación

| Criterio                                             | Descripción                                                                 |
|------------------------------------------------------|-----------------------------------------------------------------------------|
| **Agregar, Eliminar, Buscar y Actualizar usuarios** | Los usuarios deben poder ser **agregados**, **eliminados**, **buscados** y **actualizados** mediante archivos CSV. |
| **Roles y Permisos**                                 | El sistema debe permitir **asignar roles** y manejar **permisos específicos**. |
| **Interfaz de Usuario**                              | Debe contar con una **interfaz de usuario** para realizar estas operaciones. |
| **Visualización de Mazos** *(Opcional)*              | Visualización de mazos disponibles para los usuarios. |

---

## Subtareas

### 1. Agregar Usuarios por CSV

| **Épica**         | **Descripción**                                                                | **Requisitos**                                                                                                                                           | **Resultado Esperado**                         |
|-------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------|
| **Agregar Usuarios** | Permite importar usuarios (estudiantes, docentes y encargados) mediante un archivo CSV. | - El CSV debe cumplir con un formato predeterminado.  - Validar que los datos del archivo sean correctos antes de la importación. | Los usuarios se registran correctamente en la plataforma. |

---

### 2. Eliminar Usuarios

| **Épica**         | **Descripción**                                                                | **Requisitos**                                                                                                                                           | **Resultado Esperado**                         |
|-------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------|
| **Eliminar Usuarios** | Permite eliminar estudiantes, docentes y encargados de la plataforma. | - Confirmación previa antes de eliminar un usuario. - Validación de permisos para realizar esta acción. | El usuario se elimina del sistema junto con sus datos asociados. |

---

### 3. Buscar Usuarios por RUT y RBD

| **Épica**         | **Descripción**                                                                | **Requisitos**                                                                                                                                           | **Resultado Esperado**                         |
|-------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------|
| **Buscar Usuarios** | Ofrece una funcionalidad para buscar usuarios específicos por su RUT o RBD. | - Implementar filtros avanzados para búsquedas más precisas. | El usuario es encontrado y su información se muestra en la interfaz. |

---

### 4. Actualizar Datos de Usuarios por CSV

| **Épica**         | **Descripción**                                                                | **Requisitos**                                                                                                                                           | **Resultado Esperado**                         |
|-------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------|
| **Actualizar Datos** | Permite actualizar la información de múltiples usuarios utilizando un archivo CSV. | - El CSV debe incluir una columna identificadora única (RUT o ID). - Validar que los datos actualizados sean consistentes. | Los datos de los usuarios se actualizan correctamente en la base de datos. |

---

### 5. Manejo de Roles

| **Épica**         | **Descripción**                                                                | **Requisitos**                                                                                                                                           | **Resultado Esperado**                         |
|-------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------|
| **Manejo de Roles** | Asignación de roles a usuarios con permisos específicos. | - Definir roles preestablecidos (ej. Administrador, Docente, Estudiante). - Permitir la creación y personalización de nuevos roles. | Los roles se asignan correctamente y controlan los permisos de acceso. |

---

### 6. Interfaz de Usuario

| **Épica**         | **Descripción**                                                                | **Requisitos**                                                                                                                                           | **Resultado Esperado**                         |
|-------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------|
| **Interfaz de Usuario** | Crear una interfaz amigable para gestionar las operaciones relacionadas con usuarios. | - Diseño intuitivo y fácil de usar. - Soporte para todas las funcionalidades de gestión de usuarios. | Los administradores pueden realizar las operaciones con facilidad. |

---

### 7. *(Opcional)* Visualización de Mazos Disponibles

| **Épica**         | **Descripción**                                                                | **Requisitos**                                                                                                                                           | **Resultado Esperado**                         |
|-------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------|
| **Visualización de Mazos** | Permite a los usuarios visualizar los mazos de cartas disponibles. | - Mostrar un listado de mazos con información relevante (nombre, tipo, descripción, etc.).  - Opción para buscar o filtrar mazos según criterios específicos. | Los mazos disponibles se muestran en la interfaz de manera organizada. |

