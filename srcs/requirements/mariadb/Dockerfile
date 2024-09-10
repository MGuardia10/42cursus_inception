FROM    debian:bullseye

# Arguments
ARG     MYSQL_ROOT_PASSWORD
ARG     MYSQL_DATABASE
ARG     GRAFANA_DATABASE
ARG     MYSQL_USER
ARG     MYSQL_USER_PASSWORD

# Update system and install mariadb
RUN     apt update && apt upgrade -y
RUN     apt install -y mariadb-server mariadb-client

# Copy mariadb configuration from source
COPY    ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/
RUN     chmod 755 /etc/mysql/mariadb.conf.d/mariadb.cnf
COPY    ./conf/dump.sql /usr/local/bin/

# Create (if does not exist) and allow mariadb daemon to run
RUN     mkdir -p /var/run/mysqld && \
        chown -R mysql:mysql /var/run/mysqld && \
        chmod 777 /var/run/mysqld


# Copy dump.sql and scripts and run them
COPY    ./conf/dump.sql /usr/local/bin
COPY    ./tools/setup_mariadb.sh /usr/local/bin/
COPY    ./tools/init.sh /usr/local/bin/
RUN     chmod +x /usr/local/bin/setup_mariadb.sh && \
        chmod +x /usr/local/bin/init.sh && \
        bash /usr/local/bin/setup_mariadb.sh

# Expose port to host
EXPOSE 3306

# Run mariadb
ENTRYPOINT [ "./usr/local/bin/init.sh" ]
