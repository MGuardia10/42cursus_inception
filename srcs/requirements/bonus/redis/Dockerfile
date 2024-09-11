FROM    debian:bullseye

# Update system and install redis packages
RUN     apt update && apt upgrade -y
RUN     apt install -y redis-server redis-tools

# Copy init script
COPY    ./tools/init.sh /usr/local/bin/
RUN     chmod +x /usr/local/bin/init.sh

ENTRYPOINT [ "bash", "/usr/local/bin/init.sh" ]     