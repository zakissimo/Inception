all: up

build:
	@mkdir -p /home/$(USER)/data/db
	@mkdir -p /home/$(USER)/data/web
	@docker compose -f ./srcs/docker-compose.yml build --no-cache

up: build
	docker compose -f ./srcs/docker-compose.yml up -d

down:
	@docker compose -f ./srcs/docker-compose.yml down

stop:
	docker compose -f ./srcs/docker-compose.yml stop

clean: down
	docker rmi -f $(shell docker images -a -q)

fclean: clean
	sudo rm -rvf /home/$(USER)/data

.PHONY: all up clean fclean build
