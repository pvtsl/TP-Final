## TP-Final - Infraestructura de Servidores ## 

## App Apache ##   

## Dockerfile para la creación y despliegue de la aplicación Apache ## 

 
1- Crear un Dockerfile. Debe contener lo siguiente: 

  

     

    FROM ubuntu 

  

    RUN apt update && apt install apache2 git -y 

  

    COPY index.html /var/www/html/index.html 

  

    EXPOSE 80 

  

    CMD ["apachectl", "-D", "FOREGROUND"] 

     

  

2- Crear el archivo index.html: 

  

     

    <!DOCTYPE html> 

    <html lang="en"> 

    <head> 

        <meta charset="UTF-8"> 

        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 

        <title>My Apache App</title> 

    </head> 

    <body> 

        <h1>Trabajo Practico final Infraestructura de Servidores - Istea</h1> 

    </body> 

    </html> 

     

  

--- 

  

## Gestión de ramas con Git ## 

  

3- Añadir cambios y realizar un commit: 

  

     

    git add . 

    git commit -m "update" 

    git push 

     

  

4- Crear y cambiar a una nueva branch,Developer: 

  

     

    git checkout -b developer 

     

  

5- Revisar las branches que existen en el repositorio: 

  

     

    git branch 

     

  

6- Subir la branch developer al repositorio: 

  

     

    git push origin developer 

     

  

--- 

  

## Clonar el repositorio ##

  

7- Clonar el repositorio: 

  

     

    git clone https://github.com/pvtsl/TP-Final.git 

     

  

8- Acceder al directorio del proyecto: 

  

     

    cd TP-Final/TP-Final 

     

  

--- 

  

## Crear la imagen Docker ## 

  

9- Crear la imagen Docker con comando build: 

  

     

    docker build -t app-apache-img . 

     

   

--- 

  

## Despliegue del contenedor ##

  

10- Desplegar el contenedor utilizando comando run: 

  

     

    docker run -d -p 8000:80 --name app-apache app-apache-img 

     

  

11- Desplegar el contenedor utilizando Docker Compose: 

  

    Crear el archivo docker-compose.yaml con el siguiente contenido: 

  

     

    version: '3' 

    services: 

      web: 

        image: app-apache-img 

        ports: 

          - "8000:80" 

     

  

12- Desplegar el contenedor con Docker Compose: 

  

     

    docker-compose up -d 

     
## Configuración del Proxy Reverso Nginx ##

13- Añadir la siguiente configuración al servidor proxy reverso (Nginx):

    
    server {
        listen 80;
        server_name app-apache;

        location / {
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
            proxy_pass http://ip_docker_server:8080;
        }
    }
    

---
