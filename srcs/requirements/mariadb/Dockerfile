FROM    debian:bullseye

# Arguments
ARG     MYSQL_ROOT_PASSWORD
ARG     MYSQL_DATABASE
ARG     MYSQL_USER
ARG     MYSQL_USER_PASSWORD

# Update system and install mariadb
RUN     apt update && apt upgrade -y
RUN     apt install -y mariadb-server mariadb-client

# Copy mariadb configuration from source
COPY    ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/
RUN     chmod 755 /etc/mysql/mariadb.conf.d/mariadb.cnf

# Create (if does not exist) and allow mariadb daemon to run
RUN     mkdir -p /var/run/mysqld && \
        chown -R mysql:mysql /var/run/mysqld && \
        chmod 777 /var/run/mysqld


# Copy and run mariadb init script
COPY    ./tools/setup_mariadb.sh /usr/local/bin/
RUN     bash /usr/local/bin/setup_mariadb.sh

# Expose port to host
EXPOSE 3306

# Run mariadb
ENTRYPOINT [ "mysqld_safe" ]
