#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

while true; do
    # Prompt user for confirmation
    echo -en "${YELLOW}Confirm to uninstall Docker and Docker compose (Y/n): ${NC}"
    read -p "" answer1

    # Evaluate prompt
    case "$answer1" in
        [yY])
            # Uninstalling docker
            echo -e "${YELLOW}Uninstalling Docker and Docker Compose...${NC}"
            sudo apt-get purge -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
            if [ $? -eq 0 ]; then
                echo -e "${GREEN}Docker and Docker Compose succesfully uninstalled.${NC}"
                while true; do
                    # Prompt user to ask for related docker files to be deleted or not
                    echo -en "${YELLOW}Images, containers, volumes, or custom configuration files on your host aren't automatically removed. Do you want to remove those files? (Y/n): ${NC}"
                    read -p "" answer2
                    case "$answer2" in
                        [yY])
                            # Deleting files and exit
                            echo -e "${YELLOW}Deleting all Docker config files...${NC}"
                            sudo rm -rf /var/lib/docker
                            sudo rm -rf /var/lib/containerd
                            echo -e "${GREEN}Docker files successfully uninstalled${NC}"
                            exit 0
                            ;;
                        [nN])
                            # exiting without delete files
                            echo -e "${GREEN}Exiting without removing files.${NC}";
                            exit 0
                            ;;
                        *)
                            echo "${RED}Invalid answer, please type Y/n.${NC}"
                            ;;
                    esac
                done
            else
                echo -e "${RED}Unable to remove Docker and Docker Compose from system.${NC}"
                exit 1
            fi
            ;;
        [nN])
            # Exit script without deleting docker
            echo -e "${GREEN}Exiting without uninstalling Docker and Docker compose.${NC}"
            exit 0
            ;;

        *)
            # Ask for valid answer
            echo -e "${RED}Invalid answer, please type Y/n.${NC}"
            ;;
    esac
done

