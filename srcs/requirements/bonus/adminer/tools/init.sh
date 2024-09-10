#!/bin/bash

if [ ! -d "/var/run/php" ]; then
    mkdir -p /var/run/php
    sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/7.4/fpm/pool.d/www.conf
fi

if [ ! -f "/var/www/html/adminer.php" ]; then
    mkdir -p /var/www/html/
    wget -q http://www.adminer.org/latest.php -O /var/www/html/adminer.php
    chown www-data:www-data /var/www/html/adminer.php
    chmod 644 /var/www/html/adminer.php
fi

echo "Starting adminer..."
php-fpm7.4 -F