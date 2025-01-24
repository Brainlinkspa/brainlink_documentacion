---
id: Dependencias Autenticacion
title: Dependencias
sidebar_position: 1
---


# Dependencias del Sistema de Autenticación

Se describen las dependencias necesarias para ejecutar y desarrollar el sistema de autenticación basado en **NestJS**. Aquí  explicamos cada grupo de dependencias y su propósito.

---

## Dependencias Principales

Estas son las dependencias requeridas para que el sistema funcione correctamente:

| Paquete                  | Versión   | Descripción                                                                 |
|--------------------------|-----------|-----------------------------------------------------------------------------|
| **@nestjs/common**       | ^10.4.15  | Proporciona decoradores y utilidades comunes de NestJS.                     |
| **@nestjs/config**       | ^3.3.0    | Manejo de configuraciones usando variables de entorno.                      |
| **@nestjs/core**         | ^10.4.15  | El núcleo de NestJS, necesario para aplicaciones.                           |
| **@nestjs/platform-express** | ^10.4.15 | Integra NestJS con Express.                                                 |
| **bcrypt**               | ^5.1.1    | Librería para encriptar contraseñas.                                        |
| **cookie-parser**        | ^1.4.7    | Manejo de cookies en las peticiones HTTP.                                   |
| **dotenv**               | ^16.4.7   | Carga variables de entorno desde un archivo `.env`.                         |
| **jsonwebtoken**         | ^9.0.2    | Implementación de JSON Web Tokens (JWT) para autenticación.                 |
| **pg**                   | ^8.13.1   | Cliente de PostgreSQL para Node.js.                                         |

---

## Dependencias de Desarrollo

Estas herramientas son necesarias para el desarrollo, pruebas y mantenimiento del sistema:

| Paquete                         | Versión   | Descripción                                                                |
|---------------------------------|-----------|----------------------------------------------------------------------------|
| **@nestjs/cli**                 | ^10.0.0   | CLI de NestJS para generar y administrar la aplicación.                    |
| **eslint**                      | ^8.0.0    | Herramienta para analizar y mejorar la calidad del código.                 |
| **jest**                        | ^29.5.0   | Framework de pruebas unitarias.                                            |
| **typescript**                  | ^5.1.3    | Añade soporte de TypeScript al proyecto.                                   |
| **prettier**                    | ^3.0.0    | Formatea el código para mantener un estilo consistente.                    |

---

## Scripts Definidos

En el archivo `package.json`, los **scripts** definen comandos comunes que puedes ejecutar. Algunos de los más importantes son:

| Script           | Comando                              | Descripción                                                                 |
|------------------|--------------------------------------|-----------------------------------------------------------------------------|
| `start`          | `nest start`                        | Inicia el servidor en producción.                                          |
| `start:dev`      | `nest start --watch`                | Inicia el servidor en modo de desarrollo con recarga automática.           |
| `build`          | `nest build`                        | Compila la aplicación en la carpeta `dist/`.                               |
| `test`           | `jest`                              | Ejecuta las pruebas definidas en el proyecto.                              |
| `format`         | `prettier --write`                  | Aplica formato al código según las reglas de Prettier.                     |

---

## Cómo Usarlas

Para instalar las dependencias, ejecuta:

```bash
npm install