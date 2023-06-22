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
	@sudo rm -rf /home/$(USER)/data
	docker rmi -f $(shell docker images -a -q)

.PHONY: all up clean test build
