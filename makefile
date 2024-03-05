default: build

MVN = mvn

.PHONY: default build clean compile test package run up

build:
	$(MVN) package

clean:
	$(MVN) clean

compile:
	$(MVN) compile

test: clean compile
	$(MVN) test

# Package the project (without running tests)
package:
	$(MVN) package -Dmaven.test.skip=true

# Run the project
run:
	$(MVN) exec:java -Dexec.mainClass="tiw.is.vols.catalogue.App"

up:
	docker-compose up -d

# Load dev fixtures
fixtures: export PGPASSWORD=catalogue-mdp
fixtures:
	pg_restore --dbname="catalogue-db" --port=5432 --host="localhost" --username="catalogue" "./catalogue-vols/src/main/resources/fixtures.dump" --clean