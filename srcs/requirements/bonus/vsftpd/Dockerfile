FROM    alpine:3.18.3

COPY    ./conf/vsftpd.conf /etc/vsftpd.conf

# Updating system and install vsftpd
RUN     apk update && apk add vsftpd

# Copy source files
COPY    ./tools/init.sh /sbin/
RUN     chmod +x /sbin/init.sh

# Run init script
ENTRYPOINT [ "./sbin/init.sh" ]
