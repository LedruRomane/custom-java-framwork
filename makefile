default: build

MVN = mvn

.PHONY: default build clean compile test package run up

up:
	docker-compose up -d

# Reset database
db.reset:
	docker-compose down && docker-compose up -d

# Load dev fixtures
db.fixtures: export PGPASSWORD=catalogue-mdp
db.fixtures:
	pg_restore --dbname="catalogue-db" --port=5432 --host="localhost" --username="catalogue" "./catalogue-vols/src/main/resources/fixtures.dump" --clean

clean:
	$(MVN) clean

install:
	$(MVN) clean install

compile:
	$(MVN) clean compile

verify:
	$(MVN) clean verify

test:
	$(MVN) clean test

# Serve
serve: clean compile up
	cd catalogue-vols && mvn exec:java
