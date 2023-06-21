#!/bin/sh

while ! mariadb -h$DB_HOST -u$DB_USR -p$DB_PWD $DB_NAME &>/dev/null; do
    sleep 3
done

if [ ! -f "/var/www/html/index.html" ]; then

    mv /tmp/index.html /var/www/html/index.html

    wp core download --allow-root

    wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PWD --dbhost=$DB_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root

    mv wp-config-sample.php wp-config.php

    wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USR" --admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --skip-email --allow-root

    wp user create "$WP_USR" "$WP_EMAIL" --role=author --user_pass="$WP_PWD" --allow-root

    wp theme install astra --activate --allow-root

fi
