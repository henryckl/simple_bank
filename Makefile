postgres:
	docker compose up -d

createdb:
	docker exec -it postgres_simplebank createdb --username=postgres --owner=postgres simple_bank
dropdb:
	docker exec -it postgres_simplebank dropdb --username=postgres simple_bank
migrateup:
	migrate -path db/migration/ -database "postgresql://postgres:postgres@localhost:5432/simple_bank?sslmode=disable" -verbose up
migratedown:
	migrate -path db/migration/ -database "postgresql://postgres:postgres@localhost:5432/simple_bank?sslmode=disable" -verbose down
.PHONY: postgres createdb dropdb migrateup migratedown