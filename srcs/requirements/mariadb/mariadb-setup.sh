#!/bin/sh

set -x

cat << EOF > /etc/my.cnf
[mysqld]
user = root
port = 3306
datadir = /var/lib/mysql
socket = /var/run/mysqld/mysqld.sock
skip-networking = false
bind-address = 0.0.0.0
EOF

echo $DB_NAME
echo $DB_USER
echo $DB_PWD

cp /etc/my.cnf /etc/mysql/my.cnf
cp /etc/my.cnf ~/my.cnf

mysql_install_db
mysqld --user=root --datadir=/var/lib/mysql &

sleep 5

mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PWD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;
EOF

pkill mysqld
