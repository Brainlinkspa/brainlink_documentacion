# Usar una imagen base de Node.js
FROM node:18 AS build

# Crear y establecer el directorio de trabajo
WORKDIR /app

# Copiar los archivos del proyecto al contenedor
COPY . .

# Instalar las dependencias
RUN npm install

# Construir el proyecto Docusaurus
RUN npm run build

# Usar una imagen base de Nginx para servir la aplicación estática
FROM nginx:alpine

# Copiar los archivos generados de la build de Docusaurus
COPY --from=build /app/build /usr/share/nginx/html

# Exponer el puerto en el que Nginx escucha
EXPOSE 80

# Iniciar Nginx en primer plano
CMD ["nginx", "-g", "daemon off;"]