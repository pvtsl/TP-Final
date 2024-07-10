FROM ubuntu
RUN apt update && apt install apache2 git -y
COPY index.html /var/www/html/index.html
EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]

