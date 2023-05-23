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
sqlc:
	docker run --rm -v C:\Users\Home\Desktop\code\go\simple_bank:/src -w /src kjconroy/sqlc generate
test:
	go test -v -cover ./...

.PHONY: postgres createdb dropdb migrateup migratedown sqlc test