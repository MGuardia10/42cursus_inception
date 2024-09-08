#!/bin/bash

# Create dir for wordpress
mkdir -p /var/www/html/

# Download and unzip wordpress
wget http://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz

# move content wordpress dir to /var/www/html/
mv wordpress/* /var/www/html/

# Remove zip and wordpress dir
rm -rf latest.tar.gz wordpress


# Change ownership and permisions on wordpress dir
chown -R www-data:www-data /var/www/html/
find /var/www/html -type d -exec chmod 755 {} \;
find /var/www/html -type f -exec chmod 644 {} \;

# Copy sample config on config.php and configure it
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sed -i "s/define( 'DB_NAME', '.*' );/define('DB_NAME', '$MYSQL_DATABASE' );/" /var/www/html/wp-config.php
sed -i "s/define( 'DB_USER', '.*' );/define('DB_USER', '$MYSQL_USER' );/" /var/www/html/wp-config.php
sed -i "s/define( 'DB_PASSWORD', '.*' );/define('DB_PASSWORD', '$MYSQL_USER_PASSWORD' );/" /var/www/html/wp-config.php
sed -i "s/define( 'DB_HOST', '.*' );/define('DB_HOST', 'mariadb' );/" /var/www/html/wp-config.php