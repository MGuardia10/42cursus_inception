#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

# Verify one argument is passed to the script - 42 Username
if [ -z "$1" ]; then
    echo -e "${RED}Error. Username must be passed as a parameter.{NC}"
    exit 1
fi

# Assign first argument to USER
USER_42=$1

# Check if domain already exists in /etc/hosts
domain_exists() {
    if ! grep -Pqx "127.0.0.1\t$USER_42.42.fr" /etc/hosts; then
        return 1
    fi
    return 0
}

# If domain does not exist, point localhost to ${USER_42}.42.fr
if ! domain_exists ; then
    echo -e "${YELLOW}Domain not included in /etc/hosts. Proceding...${NC}"
    sudo sed -i "2i\127.0.0.1\t$USER_42.42.fr" /etc/hosts
    echo -e "${GREEN}Domain included succesfully.${NC}"
else
    echo -e "${YELLOW}Domain already exists in /etc/hosts.${NC}"
fi

