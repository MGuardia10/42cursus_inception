FROM    debian:bullseye

RUN     apt update && apt upgrade -y
RUN     apt install -y wget php php7.4-fpm

COPY    ./tools/init.sh /usr/local/bin/
RUN     chmod +x /usr/local/bin/init.sh

ENTRYPOINT [ "./usr/local/bin/init.sh" ]