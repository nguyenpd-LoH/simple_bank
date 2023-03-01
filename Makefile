postgres:
	docker run --name postgressimplebank -p 5435:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres

createdb:
	docker exec -it postgressimplebank createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgressimplebank dropdb simple_bank

migrateup:
	migrate -path db-data/migration -database "postgresql://root:secret@localhost:5435/simple_bank?sslmode=disable"  -verbose up

migratedown:
	migrate -path db-data/migration -database "postgresql://root:secret@localhost:5435/simple_bank?sslmode=disable"  -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

.PHONY: postgres createdb dropdb migrateup migratedown
