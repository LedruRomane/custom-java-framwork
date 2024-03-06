default: build

MVN = mvn

.PHONY: default build clean compile test package run up

up:
	docker-compose up -d

# Load dev fixtures
fixtures: export PGPASSWORD=catalogue-mdp
fixtures:
	pg_restore --dbname="catalogue-db" --port=5432 --host="localhost" --username="catalogue" "./catalogue-vols/src/main/resources/fixtures.dump" --clean