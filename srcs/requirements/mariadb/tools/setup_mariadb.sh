#!/bin/bash

# Init mariadb service
service mariadb start

# Create database
mariadb -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"

# Create user and grant privileges
mariadb -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'; FLUSH PRIVILEGES;"
mariadb -u root -e "FLUSH PRIVILEGES;"

# Import database dump
#mariadb -u root $MYSQL_DATABASE < /usr/local/bin/dump.sql

# Change root password and allow login from any host
mariadb -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');"
mariadb -u root -e "FLUSH PRIVILEGES;"
mariadb -u root -p $MYSQL_ROOT_PASSWORD "GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
mariadb -u root -p $MYSQL_ROOT_PASSWORD "FLUSH PRIVILEGES;"

# Stop mariadb service
service mariadb stop


