package db

import (
	"database/sql"
	"log"
	"os"
	"testing"

	_ "github.com/lib/pq"
)

var testQueries *Queries

const (
	dbDrive  = "postgres"
	dbSource = "postgresql://postgres:postgres@localhost:5432/simple_bank?sslmode=disable"
)

func TestMain(m *testing.M) {
	conn, err := sql.Open(dbDrive, dbSource)
	if err != nil {
		log.Fatal("Can not connect to db", err)
	}

	testQueries = New(conn)

	os.Exit(m.Run())
}
