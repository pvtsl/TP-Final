# TP-Final

## App Apache ##   

### Dockerfile para la creación y despliegue de la aplicación Apache 

 
Crear un Dockerfile con el siguiente contenido: 

  

     

    FROM ubuntu 

  

    RUN apt update && apt install apache2 git -y 

  

    COPY index.html /var/www/html/index.html 

  

    EXPOSE 80 

  

    CMD ["apachectl", "-D", "FOREGROUND"] 

     

  

Crear el archivo index.html: 

  

     

    <!DOCTYPE html> 

    <html lang="en"> 

    <head> 

        <meta charset="UTF-8"> 

        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 

        <title>My Apache App</title> 

    </head> 

    <body> 

        <h1>Welcome to My Apache App</h1> 

    </body> 

    </html> 

     

  

--- 

  

### Gestión de ramas con Git 

  

Añadir cambios y realizar un commit: 

  

     

    git add . 

    git commit -m "update" 

    git push 

     

  

Crear y cambiar a una nueva rama developer: 

  

     

    git checkout -b developer 

     

  

Verificar las ramas existentes: 

  

     

    git branch 

     

  

Subir la rama developer al repositorio remoto: 

  

     

    git push origin developer 

     

  

--- 

  

### Clonar el repositorio 

  

Clonar el repositorio: 

  

     

    git clone https://github.com/pvtsl/TP-Final.git 

     

  

Acceder al directorio del proyecto: 

  

     

    cd TP-Final 

     

  

--- 

  

### Crear la imagen Docker 

  

Construir la imagen Docker: 

  

     

    docker build -t app-apache-img . 

     

   

--- 

  

### Despliegue del contenedor 

  

Desplegar el contenedor utilizando comandos Docker: 

  

     

    docker run -d -p 8000:80 --name app-apache app-apache-img 

     

  

Desplegar el contenedor utilizando Docker Compose: 

  

    Crear el archivo docker-compose.yaml con el siguiente contenido: 

  

     

    version: '3' 

    services: 

      web: 

        image: app-apache-img 

        ports: 

          - "8000:80" 

     

  

    Desplegar el contenedor con Docker Compose: 

  

     

    docker-compose up -d 

     
### Configuración del Proxy Reverso

1. Añadir la siguiente configuración al servidor proxy reverso (Nginx):

    
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
