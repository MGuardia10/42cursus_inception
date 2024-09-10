#!/bin/bash

if [ ! -f "/usr/local/bin/wp" ]; then
    wget --quiet https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
    chmod +x /usr/local/bin/wp
fi

while ! wp db check --allow-root --path=/var/www/html/ > /dev/null 2>&1; do
    echo "Waiting for db to be ready..."
    sleep 1
done

# Install plugin and enable redis
echo "Installing redis plugin..."
wp plugin install redis-cache --activate --allow-root --path=/var/www/html/ > /dev/null 2>&1
echo "Activating redis cache..."
wp redis enable --allow-root --path=/var/www/html/ > /dev/null 2>&1

echo "Starting WordPress..."
php-fpm7.4 -F