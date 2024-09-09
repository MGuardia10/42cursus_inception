FROM    alpine:3.18.3

# Expose ports to host
EXPOSE 21

COPY    ./conf/vsftpd.conf /etc/vsftpd.conf
# COPY    ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

# Updating system and install vsftpd
RUN     apk update && apk add vsftpd

# Copy source files
COPY    ./tools/init.sh /sbin/
RUN     chmod +x /sbin/init.sh

# Run init script
ENTRYPOINT [ "./sbin/init.sh" ]
