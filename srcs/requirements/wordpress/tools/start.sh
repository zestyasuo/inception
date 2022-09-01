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

# mkdir -p /var/www/html/wordpress/mysite
# mv /var/www/index.html /var/www/html/wordpress/mysite/index.html
# wp core config --dbname="$WORDPRESS_NAME" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --dbhost="$DB_HOST":"$DB_PORT" --dbprefix='wp_' --allow-root
while ! mariadb -h$DB_HOST -u$MYSQL_USER -p$MYSQL_PASSWORD $WORDPRESS_NAME &>/dev/null; do
    sleep 3
done

# if [ ! -f /var/www/html/wordpress/index.php ];then
	wp core download --allow-root
	wp core install --allow-root --url=${DOMAIN_NAME} --title=${WORDPRESS_NAME} \
								--admin_user=${WORDPRESS_ROOT_LOGIN} \
								--admin_password=${MYSQL_ROOT_PASSWORD} \
								--admin_email=${WORDPRESS_ROOT_EMAIL};

    sed -i "40i define( 'WP_REDIS_HOST', '$REDIS_HOST' );"      wp-config.php
    sed -i "41i define( 'WP_REDIS_PORT', 6379 );"               wp-config.php
    #sed -i "42i define( 'WP_REDIS_PASSWORD', '$REDIS_PASS' );"   wp-config.php
    sed -i "42i define( 'WP_REDIS_TIMEOUT', 1 );"               wp-config.php
    sed -i "43i define( 'WP_REDIS_READ_TIMEOUT', 1 );"          wp-config.php
    sed -i "44i define( 'WP_REDIS_DATABASE', 0 );\n"            wp-config.php
	wp user create ${MYSQL_USER} ${WORDPRESS_USER_EMAIL} \
					--user_pass=${MYSQL_PASSWORD} \
					--role=author --allow-root;

	wp theme install neve --activate --allow-root
	wp plugin install redis-cache --activate --allow-root
    wp plugin update --all --allow-root
# fi
wp redis enable --allow-root
/usr/sbin/php-fpm8 -F