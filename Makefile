ifeq (,$(shell grep mhaman /etc/hosts))
_ := $(shell sudo bash -c '/bin/echo "127.0.0.1 mhaman.42.fr" >> /etc/hosts')
endif

SRC=srcs/docker-compose.yml

ENGINE=docker-compose

all: run

run: 
	sudo mkdir -p /home/mhaman/data/wordpress
	sudo mkdir -p /home/mhaman/data/db
	$(ENGINE) -f $(SRC) up --build

detach: 
	sudo mkdir -p /home/mhaman/data/wordpress
	sudo mkdir -p /home/mhaman/data/db
	$(ENGINE) -f $(SRC) up -d --build

ps:
	$(ENGINE) -f $(SRC) ps

top:
	$(ENGINE) -f $(SRC) top

fclean:
	$(ENGINE) -f $(SRC) down --rmi all -v
	sudo rm -rf /home/mhaman/data/

.PHONY: run detach ps top fclean 