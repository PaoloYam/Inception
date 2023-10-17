#!/bin/bash

sleep 10

mkdir -p /run/php

#change directory
cd /var/www/wordpress/

wp core install --allow-root \
    --url=${WP_URL} \
    --title=${WP_TITLE} \
    --admin_user=${WP_ADMIN_USER} \
    --admin_email=${WP_ADMIN_EMAIL} \
    --admin_password=${WP_ADMIN_PASSWORD}

wp user create --allow-root \
    ${WP_NEW_USER} \
    ${WP_EMAIL_NEW_USER} \
    --role=author \
    --user_pass=${WP_NEW_PWD}
#start php fm
/usr/sbin/php-fpm7.3 --nodaemonize
