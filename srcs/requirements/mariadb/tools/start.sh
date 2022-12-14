#!/bin/sh

if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ ! -d "/var/lib/mysql/mysql" ]; then

	chown -R mysql:mysql /var/lib/mysql

	# init database
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm >/dev/null

	tfile=$(mktemp)
	if [ ! -f "$tfile" ]; then
		return 1
	fi

	cat <<EOF >$tfile
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM	mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
CREATE DATABASE $MYSQL_DATABASE CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $WORDPRESS_NAME.* TO '$MYSQL_USER'@'%';
CREATE USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON $WORDPRESS_NAME.* TO 'root'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'
EOF
	/usr/bin/mysqld --user=mysql --bootstrap <$tfile
	rm -f $tfile
fi

# allow remote connections
sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

exec /usr/bin/mysqld --user=mysql --console
