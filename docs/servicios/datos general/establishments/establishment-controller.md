---
title: Establishment-Controller
sidebar_label: EstablishmentController
---

Se describe las rutas y flujos del controlador EstablishmentsController, que gestiona operaciones relacionadas con establecimientos educativos. Cada ruta está diseñada para realizar una tarea específica, como crear, eliminar, actualizar o verificar RBDs (Rol Único de Establecimiento).

## Importaciones

```typescript
import { Controller, Post, Delete, Body, HttpCode, HttpStatus, HttpException } from '@nestjs/common';
import axios from 'axios'; // Para solicitudes HTTP
import { ConfigService } from '@nestjs/config'; // Para variables de entorno
import { EstablishmentsService } from './establishments.service';
```

`@nestjs/common` : Proporciona decoradores y utilidades básicas.
`axios` : Realiza solicitudes HTTP a servicios externos.
`ConfigService` : Accede a variables de entorno.
`EstablishmentsService` : Contiene la lógica de negocio.

## Rutas y Flujos
## 1. Crear un Establecimiento (`POST /establishments/create`)
Crea un nuevo establecimiento y un usuario administrador asociado.

Parámetros del Cuerpo de la Solicitud

| Nombre            | Tipo   | Descripción                                   |
|-------------------|--------|-----------------------------------------------|
| `rbd`            | string | Identificador único del establecimiento.      |
| `name`           | string | Nombre del establecimiento.                   |
| `location`       | string | Ubicación del establecimiento.                |
| `contact`        | string | Información de contacto.                      |
| `address`        | string | Dirección física del establecimiento.         |
| `adminEmail`     | string | Correo electrónico del administrador.         |
| `adminPassword`  | string | Contraseña del administrador.                 |
| `masterPassword` | string | Contraseña maestra para autorización.         |

### Flujo
1. Verifica la contraseña maestra contra las variables de entorno.
2. Valida que el correo del administrador no esté registrado previamente.
3. Crea el establecimiento y el usuario administrador.

## 2. Eliminar un Establecimiento (`DELETE /establishments/delete`)
Elimina un establecimiento existente.

| Nombre           | Tipo   | Descripción                                   |
|------------------|--------|-----------------------------------------------|
| `rbd`           | string | Identificador único del establecimiento.      |
| `masterPassword`| string | Contraseña maestra para autorización.         |

### Flujo
1. Verifica la contraseña maestra.
2. Elimina el establecimiento si la verificación es exitosa.

## 3. Actualizar un Establecimiento (`POST /establishments/update`)
Actualiza la información de un establecimiento existente.

Parámetros del Cuerpo de la Solicitud

| Nombre              | Tipo   | Descripción                                   |
|---------------------|--------|-----------------------------------------------|
| `rbd`              | string | Identificador único del establecimiento.      |
| `newRbd`           | string | Nuevo RBD (opcional).                         |
| `newName`          | string | Nuevo nombre del establecimiento.             |
| `newLocation`      | string | Nueva ubicación.                              |
| `newContact`       | string | Nueva información de contacto.                |
| `newAddress`       | string | Nueva dirección física.                       |
| `newAdminEmail`    | string | Nuevo correo del administrador.               |
| `newAdminPassword` | string | Nueva contraseña del administrador.           |
| `masterPassword`   | string | Contraseña maestra para autorización.         |

### Flujo
1. Verifica la contraseña maestra.
2. Actualiza los datos del establecimiento y/o del administrador.

## 4. Verificar un RBD (`POST /establishments/verify-rbd`)
Verifica si un RBD existe en la base de datos.

Parámetros del Cuerpo de la Solicitud

| Nombre | Tipo   | Descripción                                   |
|--------|--------|-----------------------------------------------|
| `rbd`  | string | Identificador único del establecimiento.      |

### Flujo
1. Verifica la existencia del RBD en la base de datos.
2. Retorna true si existe, o un error si no.