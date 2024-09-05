# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mguardia <mguardia@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/02 17:02:51 by mguardia          #+#    #+#              #
#    Updated: 2024/09/05 11:25:52 by mguardia         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

###############################################################################
# VARIABLES
###############################################################################

# Users
USER_42 := mguardia
USER_SYSTEM := $(shell echo $$USER)

# Dirs

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

###############################################################################
# MAKEFILE RULES
###############################################################################

all: hosts 

hosts:
	@echo -e "${YELLOW}Allowing execution on hosts script...${NC}"
	sudo chmod +x ./srcs/requirements/tools/hosts.sh
	@echo -e "${YELLOW}Starting execution...${NC}"
	bash ./srcs/requirements/tools/hosts.sh ${USER_42}

docker-clean:
	@echo -e "${YELLOW}Allowing execution on docker-clean script...${NC}"
	sudo chmod +x ./srcs/requirements/tools/docker-clean.sh
	@echo -e "${YELLOW}Starting execution...${NC}"
	bash ./srcs/requirements/tools/docker-clean.sh

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


		





