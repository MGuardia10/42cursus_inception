#!/bin/bash

# Create dir for wordpress
mkdir -p /var/www/html/

# Change directory to new one
cd /var/www/html/

# Download and unzip wordpress
wget http://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz

# Remove zip
rm -rf latest.tar.gz

# Change ownership and permisions on wordpress dir
chown -R www-data:www-data /var/www/html/wordpress
chmod -R 755 /var/www/html/wordpress

# Copy sample config on config.php and configure it
mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
sed -i "s/define('DB_NAME', '.*');/define('DB_NAME', '$MYSQL_DATABASE');/" /var/www/html/wordpress/wp-config.php
sed -i "s/define('DB_USER', '.*');/define('DB_USER', '$MYSQL_USER');/" /var/www/html/wordpress/wp-config.php
sed -i "s/define('DB_PASSWORD', '.*');/define('DB_PASSWORD', '$MYSQL_USER_PASSWORD');/" /var/www/html/wordpress/wp-config.php
sed -i "s/define('DB_HOST', '.*');/define('DB_HOST', 'mariadb');/" /var/www/html/wordpress/wp-config.php