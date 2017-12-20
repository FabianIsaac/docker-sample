Docker Apache - PHP 7
===========
### Imagen base

Ubuntu 16.04

### Variables de entorno apache
Se crearan las siguientes variables de entorno para Apache

	APACHE_SERVERADMIN=admin@localhost
	APACHE_SERVERNAME=localhost
	APACHE_SERVERALIAS=docker.localhost
	APACHE_DOCUMENTROOT=/var/www/html
	APACHE_RUN_USER=www-data
	APACHE_RUN_GROUP=www-data
	APACHE_LOG_DIR=/var/web/log/apache2
	APACHE_PID_FILE=/var/run/apache2.pid
	APACHE_RUN_DIR=/var/run/apache2
	APACHE_LOCK_DIR=/var/lock/apache2


### Contruir imagen

Ejecutar `docker build -t nombre_imagen https://github.com/FabianIsaac/docker-sample.git`



### Iniciar contenedor
El contenedor tendra todo lo necesario para ser un servidor web php, dando la opcion de cambiar las configuraciones mediante las variables de entorno 

	$ sudo docker run -i -d -p 8080 -e APACHE_SERVERNAME=myServer.local 

Desde el navegador http://localhost:8080.

### Otras herramientas

- Composer