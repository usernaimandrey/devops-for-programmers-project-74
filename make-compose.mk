compose:
	docker compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

compose-install:
	docker compose --file docker-compose.yml run -u $$(id -u ${USER}):$$(id -g ${USER}) --rm app npm ci

compose-run:
	docker compose up
