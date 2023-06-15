all: up

up:
	@mkdir -p /home/zhabri/data
	docker compose up -d

down:
	@docker compose down

stop:
	docker compose stop

test:
ifeq ($(VAR), )
	@echo "EMPTY"
endif

clean: down
	@rm -rf /home/zhabri/data

.PHONY: all up clean test
