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
	migrate -database $(DB_URL_FOR_MIGRATE) -path migrations up

migrate-down: 
	migrate -database $(DB_URL_FOR_MIGRATE) -path migrations down

migrate-version:	
	@migrate -database $(DB_URL_FOR_MIGRATE) -path migrations version
