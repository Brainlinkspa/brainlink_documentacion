---
title: Users-Controller
sidebar_label: UsersController
---

Estructura General
El controlador está diseñado para manejar solicitudes HTTP relacionadas con usuarios. A continuación, se detallan las principales funcionalidades:

```typescript
import { Controller, Post, Body, HttpCode, HttpStatus, HttpException, Res, Req, Delete } from '@nestjs/common';
import { UsersService } from './users.service';
import { AuthService } from '../auth/auth.service';
import { Response, Request } from 'express';
import { Pool } from 'pg';
import { Inject } from '@nestjs/common';
```

NestJS : Se utilizan decoradores como `@Controller`, `@Post`, `@HttpCode`, etc., para definir rutas y comportamientos.
Servicios : `UsersService` y `AuthService` encapsulan la lógica de negocio.
Base de Datos : Se utiliza una conexión a PostgreSQL mediante `pg.Pool`.

## Verificación de Roles
El controlador incluye una función privada para verificar si el usuario autenticado tiene permisos específicos:

```typescript
private async verifyUserRole(req: Request, allowedRoles: number[]): Promise<boolean> {
  const token = this.authService.getTokenFromCookies(req);
  if (!token) return false;

  try {
    const decodedToken = await this.authService.verifyToken(token);
    const userRolId = decodedToken.rolId;
    return allowedRoles.includes(userRolId);
  } catch (error) {
    console.error('Error al verificar el rol del usuario:', error);
    return false;
  }
}
```

Funcionamiento : Extrae un token de las cookies, lo verifica y comprueba si el rol del usuario está permitido.
Uso : Esta función puede ser reutilizada en múltiples rutas para garantizar que solo usuarios autorizados realicen ciertas acciones.

## Creación de Usuarios
La ruta `POST /users/create` permite crear nuevos usuarios:

```typescript
@Post('create')
@HttpCode(HttpStatus.CREATED)
async createUser(
  @Body() body: { userId: string; email: string; password: string; rol_id: number },
  @Req() req: Request,
  @Res() res: Response
) {
  const { userId, email, password, rol_id } = body;

  if (!userId || !email || !password || !rol_id) {
    return res.status(HttpStatus.BAD_REQUEST).json({ message: 'Faltan datos requeridos.' });
  }

  try {
    await this.usersService.createUser(userId, email, password, rol_id);
    return res.status(HttpStatus.CREATED).json({ message: 'Usuario creado!!' });
  } catch (error) {
    console.error('Error al crear el usuario:', error);
    return res.status(HttpStatus.INTERNAL_SERVER_ERROR).json({ message: 'Error al crear el usuario.' });
  }
}
```

Validación : Verifica que todos los campos requeridos estén presentes.
Manejo de Errores : Captura errores durante la creación del usuario y devuelve mensajes apropiados.

## Eliminación de Usuarios
El controlador incluye dos métodos para eliminar usuarios:

## 1. Eliminación Individual

```typescript
@Post('delete')
@HttpCode(HttpStatus.OK)
async deleteUser(@Body('userId') userId: string, @Res() res: Response) {
  try {
    await this.usersService.deleteUser(userId);
    return res.status(HttpStatus.OK).json({ message: 'Usuario eliminado con éxito' });
  } catch (error) {
    console.error('Error al eliminar el usuario:', error);
    return res.status(HttpStatus.INTERNAL_SERVER_ERROR).json({ message: 'Error al eliminar el usuario.' });
  }
}
```

## 2. Eliminación Masiva 

```typescript
@Post('batch-delete')
@HttpCode(HttpStatus.OK)
async batchDeleteUsers(@Body('userIds') userIds: string[]) {
  try {
    if (!Array.isArray(userIds) || userIds.length === 0) {
      throw new HttpException('No se proporcionaron IDs de usuarios para eliminar', HttpStatus.BAD_REQUEST);
    }

    const query = 'DELETE FROM users WHERE id = ANY($1)';
    await this.pool.query(query, [userIds]);
    return { message: 'Usuarios eliminados con éxito' };
  } catch (error) {
    console.error('Error al eliminar usuarios:', error);
    throw new HttpException('Error al eliminar usuarios', HttpStatus.INTERNAL_SERVER_ERROR);
  }
}
```

Diferencia : La primera elimina un solo usuario, mientras que la segunda elimina múltiples usuarios en una sola solicitud.

## Actualización de Usuarios y Establecimientos
El controlador también permite actualizar usuarios y establecimientos:

## 1. Actualizar Usuario :

```typescript
@Post('update-user')
@HttpCode(HttpStatus.OK)
async updateUser(
  @Body('userId') userId: string,
  @Body('email') email: string,
  @Body('password') password: string,
  @Res() res: Response
) {
  try {
    if (!email && !password) {
      return res.status(HttpStatus.BAD_REQUEST).json({ message: 'Debe proporcionar al menos un campo para actualizar.' });
    }

    const updatedUser = await this.usersService.updateUser(userId, email, password);
    return res.status(HttpStatus.OK).json({ message: 'Usuario actualizado con éxito', user: updatedUser });
  } catch (error) {
    console.error('Error al actualizar el usuario:', error);
    return res.status(HttpStatus.INTERNAL_SERVER_ERROR).json({ message: 'Error al actualizar el usuario.' });
  }
}
```

## 2. Actualizar Establecimiento :

```typescript
@Post('update-establishment')
@HttpCode(HttpStatus.OK)
async updateEstablishment(
  @Body('id') id: string,
  @Body('newId') newId: string,
  @Body('newEmail') newEmail: string,
  @Body('newPassword') newPassword: string,
  @Res() res: Response
) {
  try {
    const updatedEstablishment = await this.usersService.updateEstablishment(id, newId, newEmail, newPassword);
    return res.status(HttpStatus.OK).json({ message: 'Establecimiento actualizado con éxito', establishment: updatedEstablishment });
  } catch (error) {
    console.error('Error al actualizar el establecimiento:', error);
    return res.status(HttpStatus.INTERNAL_SERVER_ERROR).json({ message: 'Error al actualizar el establecimiento.' });
  }
}
```

## Obtener Correos Electrónicos
Finalmente, el controlador incluye una ruta para obtener correos electrónicos de múltiples usuarios:

```typescript
@Post('get-emails')
@HttpCode(HttpStatus.OK)
async getEmails(@Body('userIds') userIds: string[], @Res() res: Response) {
  try {
    if (!Array.isArray(userIds) || userIds.length === 0) {
      return res.status(HttpStatus.BAD_REQUEST).json({ message: 'No se proporcionaron IDs de usuarios para obtener correos' });
    }

    const query = 'SELECT id, email FROM users WHERE id = ANY($1)';
    const result = await this.pool.query(query, [userIds]);

    const emailsMap = result.rows.reduce((map, row) => {
      map[row.id] = row.email;
      return map;
    }, {});

    return res.status(HttpStatus.OK).json({ message: 'Correos obtenidos con éxito', emails: emailsMap });
  } catch (error) {
    console.error('Error al obtener los correos:', error);
    return res.status(HttpStatus.INTERNAL_SERVER_ERROR).json({ message: 'Error al obtener los correos' });
  }
}
```