# if [ ! -d /var/www/html/wordpress ]; then
# 	echo "wordpress dir does not exist. downloading..."
# 	mkdir /var/www/html
# 	wget -P /var/www/html https://wordpress.org/latest.tar.gz
# 	tar -xzf /var/www/html/latest.tar.gz -C /var/www/html
# 	rm -f /var/www/latest.tar.gz
# 	mv /var/www/wp-config.php /var/www/html/wordpress/wp-config.php
# 	# cat /var/www/html/wordpress/wp-config.php
# 	# ls -la var/www/html/wordpress
# fi

# sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = wordpress:9000/" "/etc/php8/php-fpm.d/www.conf";
# mkdir -p /var/www/html/wordpress/mysite
# mv /var/www/index.html /var/www/html/wordpress/mysite/index.html
wp core download --allow-root
# wp core config --dbname="$WORDPRESS_NAME" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --dbhost="$DB_HOST":"$DB_PORT" --dbprefix='wp_' --allow-root
wp core install --allow-root --url=${DOMAIN_NAME} --title=${WORDPRESS_NAME} --admin_user=${WORDPRESS_ROOT_LOGIN} \
							--admin_password=${MYSQL_ROOT_PASSWORD} --admin_email=${WORDPRESS_ROOT_EMAIL};

wp user create ${MYSQL_USER} ${WORDPRESS_USER_EMAIL} --user_pass=${MYSQL_PASSWORD} --role=author --allow-root;
mv /var/www/404.html /var/www/wordpress/404.html

wp theme install neve --activate --allow-root
/usr/sbin/php-fpm8 -F