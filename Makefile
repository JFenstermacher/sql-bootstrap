SCRIPT_DIR := $(PWD)/scripts
SCRIPT := main.sql

clean: down
	@docker volume rm postgres-practice

up:
	@docker compose up -d

down:
	@docker compose down

run:
	@docker compose exec postgres psql -U postgres -f /sqlscripts/$(SCRIPT)

connect:
	@docker compose exec postgres psql -U postgres
