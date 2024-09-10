#!/bin/sh

check_connection() {
  mysql -h mariadb -u $MYSQL_USER -p$MYSQL_USER_PASSWORD -e "USE $GRAFANA_DATABASE;" > /dev/null 2>&1
}

while true; do
  echo "Trying to connect with mariadb..."
  if check_connection >/dev/null; then
    break
  fi
  sleep 1
done

echo "Running grafana..."
grafana-server --homepath=/usr/share/grafana --config=/etc/grafana/grafana.ini > /dev/null