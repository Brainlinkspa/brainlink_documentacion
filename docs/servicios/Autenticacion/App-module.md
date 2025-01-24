---
id: app-module
title: AppModule y Configuración Inicial
sidebar_label: AppModule
sidebar_position: 2
---

# AppModule y Configuración Inicial

El `AppModule` es el módulo principal de la aplicación **NestJS** y actúa como punto de entrada para los demás módulos y servicios. Aquí se detalla su configuración y cómo se han integrado funcionalidades clave.

---

## Importaciones Principales

El módulo utiliza varias dependencias importantes para estructurar la aplicación:

```typescript
import { Module, OnModuleInit } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { UsersModule } from './users/users.module';
import { AuthModule } from './auth/auth.module';
import { DatabaseModule } from './database/database.module';
import { ServeStaticModule } from '@nestjs/serve-static';
import { join } from 'path';
import { UsersService } from './users/users.service';