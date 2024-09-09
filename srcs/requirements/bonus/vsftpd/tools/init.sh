#!/bin/sh

check_user_exists() {
    id "$1" > /dev/null 2>&1
}

if ! check_user_exists "$FTP_USER"; then
    echo "Creating FTP user..."
    mkdir -p /wordpress
    adduser -h /wordpress $FTP_USER > /dev/null 2>&1 << EOF
$FTP_PASSWORD
$FTP_PASSWORD
EOF
fi

# add user to ftp userlist
echo "$FTP_USER"|tee -a /etc/vsftpd.userlist > /dev/null

# make ftp_user only owner of his home dir
chown -R nobody:nogroup /wordpress
chown -R "$FTP_USER":"$FTP_USER" /wordpress

# Start ftp server
echo "Starting FTP server..."
vsftpd