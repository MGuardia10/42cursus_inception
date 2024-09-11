# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mguardia <mguardia@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/02 17:02:51 by mguardia          #+#    #+#              #
#    Updated: 2024/09/11 16:11:16 by mguardia         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

###############################################################################
# VARIABLES
###############################################################################

# 42 User for domain
USER_42 := mguardia

# Compose file path
COMPOSE_FILE := ./srcs/docker-compose.yml

# Volumes
VOLUMES_DIR := /home/$(USER)/data
VOLUMES := wordpress mariadb
VOLUME = $(addprefix $(VOLUMES_DIR)/, $(VOLUMES))

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

###############################################################################
# MAKEFILE RULES
###############################################################################

all: hosts $(VOLUME) up
	@echo ""
	@echo "${GREEN}############################################################${NC}"
	@echo ""
	@echo "Worpress running at ${YELLOW}https://$(USER_42).42.fr:443${NC}"
	@echo "Adminer running at ${YELLOW}https://$(USER_42).42.fr:443/adminer${NC}"
	@echo "Grafana running at ${YELLOW}https://$(USER_42).42.fr:443/grafana${NC}"
	@echo "Static Website running at ${YELLOW}http://$(USER_42).42.fr:4173${NC}"
	@echo ""
	@echo "${GREEN}############################################################${NC}"

hosts:
	@echo -e "${YELLOW}Allowing execution on hosts script...${NC}"
	sudo chmod +x ./srcs/requirements/tools/hosts.sh
	@echo -e "${YELLOW}Starting execution...${NC}"
	bash ./srcs/requirements/tools/hosts.sh ${USER_42}

$(VOLUME):
	sudo mkdir -p $(VOLUME) 2> /dev/null

up:
	@echo -e "${YELLOW}Starting containers...${NC}"
	sudo docker compose -f ${COMPOSE_FILE} up -d --build

down:
	@echo -e "${YELLOW}Stopping containers...${NC}"
	sudo docker compose -f ${COMPOSE_FILE} down

clean:
	@echo -e "${YELLOW}Allowing execution on docker-clean script...${NC}"
	sudo chmod +x ./srcs/requirements/tools/docker-clean.sh
	@echo -e "${YELLOW}Starting execution...${NC}"
	bash ./srcs/requirements/tools/docker-clean.sh ${USER_42}

clean-volumes:
	@echo -e "${YELLOW}Removing local volumes directory.${NC}"
	sudo rm -rf /home/$(USER)/data

docker-install:
	@echo -e "${YELLOW}Allowing execution on docker-install script...${NC}"
	sudo chmod +x ./srcs/requirements/tools/docker-install.sh
	@echo -e "${YELLOW}Starting execution...${NC}"
	bash ./srcs/requirements/tools/docker-install.sh

docker-uninstall:
	@echo -e "${YELLOW}Allowing execution on docker-uninstall script...${NC}"
	sudo chmod +x ./srcs/requirements/tools/docker-uninstall.sh
	@echo -e "${YELLOW}Starting execution...${NC}"
	bash ./srcs/requirements/tools/docker-uninstall.sh

re: down all

.PHONY: all clean re

		





