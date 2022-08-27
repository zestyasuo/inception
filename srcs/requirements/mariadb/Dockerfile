FROM alpine:3.16

RUN	apk update && apk upgrade && apk add --no-cache \
	mariadb \
	mariadb-client 

COPY ./conf/mariadb-server.cnf /etc/mysql/my.cnf.d/
COPY ./tools /var/www/
EXPOSE 3306

CMD sh /var/www/start.sh