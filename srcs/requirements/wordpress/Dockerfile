FROM alpine:3.16

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache \
	php php-fpm php-mysqli curl php-phar php-iconv

RUN addgroup -S nginx && adduser -S nginx -G nginx
EXPOSE 9000

COPY ./conf/www.conf /etc/php8/php-fpm.d/www.conf
COPY ./tools /var/www/
RUN mkdir run/php
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
RUN chmod +x wp-cli.phar;
RUN mv wp-cli.phar /usr/local/bin/wp;
RUN mkdir -p /var/www/html/wordpress
RUN mv /var/www/wp-config.php /var/www/html/wordpress/wp-config.php
WORKDIR /var/www/html/wordpress

CMD sh /var/www/start.sh