compose:
	docker compose --file docker-compose.yml up --abort-on-container-exit --exit-code-from app

compose-install:
	docker compose  run -u $$(id -u ${USER}):$$(id -g ${USER}) --rm app npm ci

compose-run:
	docker compose up -d

compose-stop:
	docker compose stop || true

compose-build:
	docker compose --file docker-compose.yml build app

compose-push:
	docker-compose -f docker-compose.yml push app
