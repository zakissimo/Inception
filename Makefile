all: up

up:
	@mkdir -p /home/zhabri/data/db
	@mkdir -p /home/zhabri/data/web
	docker compose -f ./srcs/docker-compose.yml up -d

down:
	@docker compose -f ./srcs/docker-compose.yml down

stop:
	docker compose -f ./srcs/docker-compose.yml stop

clean: down
	@sudo rm -rf /home/zhabri/data

.PHONY: all up clean test
