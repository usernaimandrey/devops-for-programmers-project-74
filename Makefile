include make-compose.mk

image = node:14.18.1

app-node:
	docker run -it -u $$(id -u $${USER}):$$(id -g $${USER})  -w /root -v `pwd`/app:/root $(P) $(image) $(T)

install:
	cp -n .env.example .env || true
	make app-node T='make setup'


start:
	make app-node P='-p 8080:8080' T='make dev'

