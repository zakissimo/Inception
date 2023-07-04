ENV_SRC = $(HOME)/.env
ENV_DEST = $(PWD)/srcs/.env

all: up

set_env:
	@if [ ! -f $(ENV_DEST) ] && [ ! -f $(ENV_SRC) ]; then \
		echo "Env file not found. Exiting..." >&2; \
		exit 1; \
	elif [ ! -f $(ENV_DEST) ]; then \
		cp -v $(ENV_SRC) $(ENV_DEST); \
	fi

mk_data:
	@mkdir -p $(HOME)/data/db
	@mkdir -p $(HOME)/data/web

build: set_env mk_data
	@docker compose -f ./srcs/docker-compose.yml build --no-cache

up: build
	docker compose -f ./srcs/docker-compose.yml up -d

down:
	@docker compose -f ./srcs/docker-compose.yml down --remove-orphans

stop:
	docker compose -f ./srcs/docker-compose.yml stop

clean: down
	@docker system prune -af --volumes
	sudo rm -rvf $(HOME)/data

.PHONY: all up clean build set_env mk_data stop down
