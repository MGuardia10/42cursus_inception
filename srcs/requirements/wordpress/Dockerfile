FROM    debian:bullseye

# Arguments
ARG     MYSQL_DATABASE
ARG     MYSQL_USER
ARG     MYSQL_USER_PASSWORD

# Update system and install wget and php-fpm
RUN     apt update && apt upgrade -y
RUN     apt install -y wget php7.4-fpm php7.4-mysql mariadb-client

# Copy php configurations
RUN     mv /etc/php/7.4/fpm/pool.d/www.conf /etc/php/7.4/fpm/pool.d/www.conf.default
COPY    ./conf/www.conf /etc/php/7.4/fpm/pool.d/

# Create PID directory to avoid initialization error
RUN     mkdir -p /run/php/ && \
        chmod 755 /run/php

# Downloading and set up Wordpress
COPY    ./tools/setup_wordpress.sh /usr/local/bin/
RUN     bash /usr/local/bin/setup_wordpress.sh

# Copy init script
COPY    ./tools/init.sh /usr/local/bin/
RUN     chmod +x /usr/local/bin/init.sh 

# Start php-fpm
ENTRYPOINT [ "bash", "/usr/local/bin/init.sh" ]