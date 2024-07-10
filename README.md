## TP-Final - Infraestructura de Servidores ## 

## App Apache2 ##   

## README.MD para la formatear y montar un volumen en Docker, lanzar Apache2 y configurar un servidor Nginx ## 
 

 
1- Formatear y montar un volumen en un directorio a elección: 

  

     

    docker volume create mi_appapache

     

  

2- Para poder lanzar un contenedor con la imagen Ubuntu/Apache2 y montar el directorio /var/www/HTML con el directorio asociado al volumen creado, coloca el siguiente comando: 

  

     

    docker run -d -p 8080:80 -v mi_volumen:/var/www/html --name app-apache ubuntu/apache2


     

  

--- 

  

## Desplegar el contenedor con Docker Compose: ## 

  

 

     

    docker-compose up -d 

     

  

4- Para clonar el repositorio y copiar el fichero index.html de la rama main al punto de montaje del contenedor, sigue estos pasos:: 

  

     

    git clone https://github.com/pvtsl/TP-Final.git
cd TP-Final/TP-Final
git checkout main
cp index.html /var/lib/docker/volumes/mi_volumen/_data/ 

     


     
## Configuración del Proxy Reverso Nginx ##

- Añadir la siguiente configuración al servidor proxy reverso (Nginx):

    
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

