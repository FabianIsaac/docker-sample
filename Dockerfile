FROM ubuntu:16.04

# Update the package repository
RUN apt-get update -y && apt-get upgrade -y

# Instalar programas base
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget curl

# Instalar apache
RUN apt-get install -y apache2 libapache2-mod-auth-pgsql libapache2-mod-php7.0

# Instalar PHP7
RUN apt-get install -y php7.0 php7.0-cli php7.0-mcrypt php7.0-curl php7.0-pgsql

# Instalar herramientas
RUN apt-get install -y composer

ADD ./config/001-docker.conf /etc/apache2/sites-available/
RUN ln -s /etc/apache2/sites-available/001-docker.conf /etc/apache2/sites-enabled/


# Set Apache environment variables (can be changed on docker run with -e)
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_SERVERADMIN admin@localhost
ENV APACHE_SERVERNAME localhost
ENV APACHE_SERVERALIAS docker.localhost
ENV APACHE_DOCUMENTROOT /var/www/html

EXPOSE 80
ADD ./scripts/info.php /var/www/html/info.php
ADD ./scripts/start.sh /start.sh
RUN chmod 0755 /start.sh
CMD ["bash", "start.sh"]
