#!/bin/bash

if [ ! -f "/usr/local/bin/wp" ]; then
    wget --quiet https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
    chmod +x /usr/local/bin/wp
fi

check_connection() {
    mysql -h mariadb -u $MYSQL_USER -p$MYSQL_USER_PASSWORD -e "USE $MYSQL_DATABASE;" > /dev/null 2>&1
}

while true; do
    echo "Waiting for db to be ready..."
    if check_connection ; then
        break
    fi
    sleep 1
done

# Install plugin and enable redis
echo "Installing redis plugin..."
wp plugin install redis-cache --activate --allow-root --path=/var/www/html/ 2> /dev/null
echo "Activating redis cache..."
wp redis enable --allow-root --path=/var/www/html/ 2> /dev/null

echo "Starting WordPress..."
php-fpm7.4 -F