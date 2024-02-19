#Seteamos la versión de Node
FROM node:21-slim as build

#instalamos pnpm 
RUN npm install -g pnpm

#Copiamos nuestro Astro en la carpeta /app
COPY . /app

#Establecemos el directorio de trabajo para ejecutar los comandos de instalación
WORKDIR /app

RUN pnpm install 
RUN pnpm run build

#Descargamos la última imagen de nginx
FROM nginx:latest
#Copiamos el contenido de la carpeta app a la carpeta /var/www/html
#COPY ../web /var/www/html
#Copiamos el archivo de .htpasswd para poder pedir contraseña al acceder a la página
COPY ./nginx/.htpasswd /etc/nginx/.htpasswd

#Copiamos el archivo de certificado y la clave privada
COPY ./nginx/certs/nginx-selfsigned.crt /etc/nginx/ssl/nginx-selfsigned.crt
COPY ./nginx/certs/nginx-selfsigned.key /etc/nginx/ssl/nginx-selfsigned.key
#Copiamos el archivo de configuración de nginx
COPY ./nginx/site.conf /etc/nginx/conf.d/default.conf

COPY --from=build /app/dist /var/www/html

#Exponemos el puerto 80
EXPOSE 80
#Exponemos el puerto 443
EXPOSE 443
#Ejecutamos nginx como servidor web
CMD ["nginx", "-g", "daemon off;"]
