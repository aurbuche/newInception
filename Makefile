<<<<<<< HEAD
ifeq (,$(shell grep aurbuche /etc/hosts))
_ := $(shell sudo bash -c '/bin/echo "127.0.0.1 aurbuche.42.fr" >> /etc/hosts')
endif
=======
DOCKER_COMPOSE				= 	sudo docker-compose
>>>>>>> a1ac28974d9e823713e578bf9f51efd1b4539bec

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

<<<<<<< HEAD
ps:
	$(ENGINE) -f $(SRC) ps

top:
	$(ENGINE) -f $(SRC) top

fclean:
	$(ENGINE) -f $(SRC) down --rmi all -v
	sudo rm -rf /home/aurbuche/data/

.PHONY: run detach ps top fclean 
=======
clean:
	@${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} down
	@sudo rm -rf /home/aurbuche/data/wordpress/*
	@sudo rm -- -rf /home/aurbuche/data/mariadb/*
>>>>>>> a1ac28974d9e823713e578bf9f51efd1b4539bec
