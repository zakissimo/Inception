#!/bin/sh

mkdir -p /var/www/html && cd /var/www/html

wp core download --allow-root

sed -i -r "s/database_name_here/$DB_NAME/1" wp-config-sample.php
sed -i -r "s/username_here/$DB_USER/1" wp-config-sample.php
sed -i -r "s/password_here/$DB_PWD/1" wp-config-sample.php
sed -i -r "s/localhost/mariadb/1"    wp-config-sample.php
mv wp-config-sample.php wp-config.php

wp core install --url="$DOMAIN_NAME"/ --title="$WP_TITLE" --admin_user="$WP_ADMIN_USR" --admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --skip-email --allow-root

wp user create "$WP_USR" "$WP_EMAIL" --role=author --user_pass="$WP_PWD" --allow-root

wp theme install astra --activate --allow-root
