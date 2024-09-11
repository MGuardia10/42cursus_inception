FROM    alpine:3.18.3

ARG GRAFANA_DATABASE
ARG MYSQL_USER
ARG MYSQL_USER_PASSWORD

# Update system and install grafana
RUN     apk update && apk add grafana mariadb-client

# Copy config files
COPY    ./conf/grafana.ini /etc/grafana/
RUN     sed -i "s|DATABASE_HERE|${GRAFANA_DATABASE}|g" /etc/grafana/grafana.ini
RUN     sed -i "s|USER_HERE|${MYSQL_USER}|g" /etc/grafana/grafana.ini
RUN     sed -i "s|PASSWORD_HERE|${MYSQL_USER_PASSWORD}|g" /etc/grafana/grafana.ini

# Copy init file
COPY    ./tools/init.sh /usr/local/bin/
RUN     chmod +x /usr/local/bin/init.sh

# EXPOSE 3000

ENTRYPOINT [ "./usr/local/bin/init.sh" ]