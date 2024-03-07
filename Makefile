include .env
DB_URL_FOR_MIGRATE="$(DATABASE_URL)?sslmode=disable&search_path=public" 

create-new-migration:
	@read -p "Enter new migration name: " migration ; \
	migrate create -ext sql -dir migrations -seq "$$migration"
dev:
	air

run-migration:
	echo $(DB_URL_FOR_MIGRATE)

generate-.env.example: 
	@awk -F '=' '{ print $$1 "="}' .env > .env.example
	@echo "Generated file .env.example"

migrate-up: 
	@read -p "UP : " level ; \
	migrate -database $(DB_URL_FOR_MIGRATE) -path migrations up "$$level"

migrate-up-all: 
	migrate -database $(DB_URL_FOR_MIGRATE) -path migrations up

migrate-down-all: 
	migrate -database $(DB_URL_FOR_MIGRATE) -path migrations down

migrate-down: 
	@read -p "DOWN : " level ; \
	migrate -database $(DB_URL_FOR_MIGRATE) -path migrations down "$$level"

migrate-goto: 
	@read -p "goto : " level ; \
	migrate -database $(DB_URL_FOR_MIGRATE) -path migrations goto "$$level"

migrate-force: 
	@read -p "goto (force) : " level ; \
	migrate -database $(DB_URL_FOR_MIGRATE) -path migrations force "$$level"

migrate-version:	
	@migrate -database $(DB_URL_FOR_MIGRATE) -path migrations version
