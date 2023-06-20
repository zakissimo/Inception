#!/bin/sh

cat << EOF > /etc/my.cnf
[mysqld]
user = root
port = 3306
datadir = /var/lib/mysql
basedir = /usr/local
socket = /var/run/mysqld/mysqld.sock
skip-networking = false
bind-address = 0.0.0.0
EOF

/usr/bin/mysql_install_db --user=root --basedir=/usr/local --datadir=/var/lib/mysql
/usr/bin/mysqld & sleep 2

mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${MARIADB_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_PWD}';"
mysql -e "FLUSH PRIVILEGES;"

pkill mysqld
/usr/bin/mysqld --user=root --datadir=/var/lib/mysql
