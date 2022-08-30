FROM alpine:3.16

RUN apk update && apk upgrade \
	&& apk add --no-cache \
	php php-fpm php-mysqli wget php-phar php-iconv php-session

EXPOSE 9000

COPY ./conf/www.conf /etc/php8/php-fpm.d/www.conf
RUN mkdir -p /var/www/html/adminer
RUN wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer/adminer.php
RUN addgroup -S nginx && adduser -S nginx -G nginx
RUN chown -R nginx:nginx /var/www/html/adminer/adminer.php
RUN chmod 755 /var/www/html/adminer/adminer.php

CMD /usr/sbin/php-fpm8 -F