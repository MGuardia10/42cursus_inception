#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

# Function to check if Docker is installed
check_docker_installed() {
    docker -v &> /dev/null
    if [ $? -eq 0 ]; then
        echo -e "${YELLOW}Docker already installed.${NC}"
        docker -v
        return 0
    else
        return 1
    fi
}

# Function to check if Docker Compose is installed
check_docker_compose_installed() {
    docker compose version &> /dev/null
    if  [ $? -eq 0 ]; then
        echo -e "${YELLOW}Docker compose already installed.${NC}"
        docker compose version
        return 0
    else
        return 1
    fi
}

# Check if both services are already installed or need to be installed via official script: get-docker.sh
if check_docker_installed && check_docker_compose_installed; then
    echo -e "${GREEN}Docker and Docker compose already installed.${NC}"
    exit 0
else
    echo -e "${YELLOW}Docker and Docker Compose needs to be installed. Proceding...${NC}"
    sleep 1
    echo -e "${YELLOW}updating system packages...${NC}"
	sudo apt update -y && sudo apt upgrade -y
	if [ $? -eq 0 ]; then
		echo -e "${GREEN}System updated successfully${NC}";
		echo -e "${YELLOW}Installing other necessary dependencies...${NC}";
		sudo apt install -y curl;
		if [ $? -eq 0 ]; then
			echo -e "${GREEN}dependencies installed successfully${NC}";
		else
			echo -e "${RED}curl installation failed${NC}";
		fi
	else
		echo "${RED}System update failed${NC}";
	fi
    echo -e "${YELLOW}Downloading script from official Docker site...${NC}"
    curl -fsSL https://get.docker.com -o ./get-docker.sh
    echo -e "${YELLOW}Executing script...${NC}"
    sh get-docker.sh
fi

# Remove get-docker.sh script to keep directory clean
sudo rm -rf ./get-docker.sh

# Verify if Docker and Docker Compose installed successfully and exit accordingly
if check_docker_installed && check_docker_compose_installed; then
    echo -e "${GREEN}Docker and Docker Compose succesfully installed!${NC}"
    exit 0
else
    echo -e "${RED}Something went wrong with installation.${NC}"
    exit 1
fi