FROM debian:latest
RUN apt update -y && apt install git apache2 php-common libapache2-mod-php php-cli wget -y && rm /var/www/html/index.html
WORKDIR /var/www/html
RUN wget https://raw.githubusercontent.com/Fenikks/itacademy-devops-files/master/01-demosite-php/index.php
CMD ["apachectl", "-D", "FOREGROUND"]