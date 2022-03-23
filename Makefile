ifeq (,$(shell grep aurbuche /etc/hosts))
_ := $(shell sudo bash -c '/bin/echo "127.0.0.1 aurbuche.42.fr" >> /etc/hosts')
endif

SRC=srcs/docker-compose.yml

ENGINE=docker-compose

all: run

run: 
	sudo mkdir -p /home/aurbuche/data/wordpress
	sudo mkdir -p /home/aurbuche/data/db
	$(ENGINE) -f $(SRC) up --build

detach: 
	sudo mkdir -p /home/aurbuche/data/wordpress
	sudo mkdir -p /home/aurbuche/data/db
	$(ENGINE) -f $(SRC) up -d --build

ps:
	$(ENGINE) -f $(SRC) ps

top:
	$(ENGINE) -f $(SRC) top

fclean:
	$(ENGINE) -f $(SRC) down --rmi all -v
	sudo rm -rf /home/aurbuche/data/

.PHONY: run detach ps top fclean 