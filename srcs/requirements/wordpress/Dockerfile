FROM    debian:bullseye

# Arguments
ARG     MYSQL_DATABASE
ARG     MYSQL_USER
ARG     MYSQL_USER_PASSWORD


# Update system and install wget and php-fpm
RUN     apt update && apt upgrade -y
RUN     apt install -y wget php7.4-fpm php7.4-mysql mariadb-client

# Configure php
RUN     mv /etc/php/7.4/fpm/pool.d/www.conf /etc/php/7.4/fpm/pool.d/www.conf.default
COPY    ./conf/www.conf /ect/php/7.4/fpm/pool.d/
RUN     ln -s $(find /usr/sbin -name 'php-fpm*') /usr/bin/php-fpm

# Downloading and set up Wordpress
COPY    ./tools/setup_wordpress.sh /usr/local/bin/
RUN     bash /usr/local/bin/setup_wordpress.sh

# Expose port to host
EXPOSE  9000

# Start php-fpm
ENTRYPOINT [ "php-fpm", "-F" ]