---
id: users-service
title: Servicio crear usuarios
---

# Servicio para crear usuarios

El servicio para crear usuarios (`UsersService`) es responsable de manejar la lógica relacionada con la creación de usuarios y la verificación de la existencia de un usuario administrador en el sistema. Este servicio interactúa con una base de datos PostgreSQL y utiliza `bcrypt` para encriptar las contraseñas de los usuarios.

## Flujo de Operaciones

### Conexión a la Base de Datos

Se utiliza un **pool de conexiones PostgreSQL** para interactuar con la base de datos, con las credenciales y parámetros de configuración definidos en el archivo de entorno.

```typescript
this.pool = new Pool({
  host: process.env.DB_HOST,
  port: parseInt(process.env.DB_PORT, 10),
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
});
```

El `UsersService` gestiona la creación de usuarios y garantiza que siempre haya un usuario administrador en el sistema. Utiliza un **pool de conexiones PostgreSQL** para interactuar con la base de datos y **bcrypt** para encriptar las contraseñas de los usuarios.

### Crear un Nuevo Usuario

La función `createUser` se utiliza para crear un nuevo usuario. Esta operación generalmente será realizada por un administrador.

#### Generación del ID único
Se realiza una consulta a la base de datos para generar un **ID único** para el nuevo usuario utilizando la función `generar_id_unico()` definida en la base de datos.

#### Encriptación de Contraseña
La contraseña proporcionada por el usuario se **encripta** usando `bcrypt` con un factor de 10.

#### Inserción en la Base de Datos
Una vez generados el ID único y la contraseña encriptada, el nuevo usuario se inserta en la tabla `users` con el email, la contraseña encriptada y el rol correspondiente.

```typescript
const hashedPassword = await bcrypt.hash(password, 10);
const query = 'INSERT INTO users (id, email, contraseña, rol_id) VALUES ($1, $2, $3, $4) RETURNING *';
const values = [userId, email, hashedPassword, rolId];
```