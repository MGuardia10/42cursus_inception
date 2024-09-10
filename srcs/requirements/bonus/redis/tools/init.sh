#!/bin/bash

# redis configuration
if [ ! -d "/run/redis" ]; then
    mkdir -p /run/redis && chmod 755 /run/redis
    sed -i 's/bind 127.0.0.1/#bind 127.0.0.1/' /etc/redis/redis.conf
fi

# Running redis
echo "Starting redis server..."
redis-server --protected-mode no > /dev/null