echo "starting nginx server"
if [ ! -f /etc/ssl/certs/nginx.crt ]; then
	echo "nginx: setting up ssl key"
	mkdir -p /etc/ssl/private
	mkdir -p /etc/ssl/certs
	openssl req -nodes -x509 -days 365 -newkey rsa:4096 \
		-keyout /etc/ssl/private/nginx.key \
		-out /etc/ssl/certs/nginx.crt \
		-subj "/C=RU/ST=Moscow/L=Moscow/O=21school/OU=zyasuo/CN=zyasuo.42.fr/"
	mkdir -p /var/www/html
	echo "nginx: key set up"
fi
nginx -g 'daemon off;';
