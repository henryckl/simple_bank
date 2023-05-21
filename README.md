migrate create -ext sql -dir .\db\migration\ -seq init_schema

docker exec -it <container_name> /bin/sh 
createdb --username=postgres --owner=postgres simple_bank
dropdb --username=postgres simple_bank

docker exec -it postgres_simplebank createdb --username=postgres --owner=postgres simple_bank

docker exec -it postgres_simplebank dropdb --username=postgres simple_bank