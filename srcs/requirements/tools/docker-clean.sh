#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

while true; do
    # Prompt user for confirmation
    echo -en "${YELLOW}Confirm to clean all images, containers, networks and volumes created (Y/n): ${NC}"
    read -p "" answer1

    # Evaluate prompt
    case "$answer1" in
        [yY])
            # Stoping and removing containers, and removing images, volumes and networks created
            echo -e "${YELLOW}Proceding...${NC}"
            sudo docker stop $(sudo docker ps -qa) 2> /dev/null;
            sudo docker rm $(sudo docker ps -qa) 2> /dev/null;
            sudo docker rmi -f $(sudo docker images -qa) 2> /dev/null;
            sudo docker volume rm $(sudo docker volume ls -q) 2> /dev/null;
            sudo docker network rm $(sudo docker network ls -q) 2> /dev/null;
            echo -e "${GREEN}Everything removed OK${NC}"
            exit 0
            ;;
        [nN])
            # Exit script without deleting docker
            echo -e "${GREEN}Exiting without removing anything.${NC}"
            exit 0
            ;;

        *)
            # Ask for valid answer
            echo -e "${RED}Invalid answer, please type Y/n.${NC}"
            ;;
    esac
done

