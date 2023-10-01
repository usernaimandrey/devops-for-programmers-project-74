compose-start:
	docker-compose up --abort-on-container-exit

compose-test:
	docker-compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

compose-setup: compose-build compose-install

compose-install:
	docker-compose run --rm app npm install

compose-build:
	docker-compose build

compose-bash:
	docker-compose run --rm app bash

prepare-env:
	cp -n .env.example .env

compose-production-build:
	docker-compose -f docker-compose.yml build

ci: prepare-env compose-production-build compose-test
