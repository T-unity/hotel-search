RUN := run --rm
DOCKER_COMPOSE_RUN := docker-compose $(RUN)
args := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))

init:
	@make build
	@make bundle_install
	@make dbcreate
	@make dbmigrate
	@make dbseed

build:
	docker-compose build

rebuild:
	docker-compose build --force-rm --no-cache

up:
	docker-compose up

upd:
	docker-compose up -d

down:
	docker-compose down

attach:
	docker attach (docker-compose ps -q app)

bash:
	${DOCKER_COMPOSE_RUN} app bash

bundle_install:
	${DOCKER_COMPOSE_RUN} app bundle install

console:
	${DOCKER_COMPOSE_RUN} app rails c

dbconsole:
	${DOCKER_COMPOSE_RUN} app rails dbconsole

dbcreate:
	${DOCKER_COMPOSE_RUN} app rails db:create
	${DOCKER_COMPOSE_RUN} app rails db:create RAILS_ENV=test

dbmigrate:
	${DOCKER_COMPOSE_RUN} app rails db:migrate
	${DOCKER_COMPOSE_RUN} app rails db:migrate RAILS_ENV=test

dbseed:
	${DOCKER_COMPOSE_RUN} app rails db:seed
	${DOCKER_COMPOSE_RUN} app rails db:seed RAILS_ENV=test

dbreset:
	${DOCKER_COMPOSE_RUN} app rails db:migrate:reset
	@make dbseed

annotate:
	${DOCKER_COMPOSE_RUN} app annotate

rails:
	${DOCKER_COMPOSE_RUN} app rails $(args)

rspec:
	${DOCKER_COMPOSE_RUN} -e RAILS_ENV=test app rspec $(args)

rubocop:
	${DOCKER_COMPOSE_RUN} app rubocop $(args)

brakeman:
	${DOCKER_COMPOSE_RUN} app brakeman

down.all:
	if [ -n "`docker ps -q`" ]; then docker kill `docker ps -q`; fi
		docker container prune -f

swagger_update:
	${DOCKER_COMPOSE_RUN} -e RAILS_ENV=test app rspec --format Rswag::Specs::SwaggerFormatter --order defined --pattern 'spec/requests/**/*_spec.rb'

credential_edit:
	${DOCKER_COMPOSE_RUN} -e EDITOR=vim app rails credentials:edit -e $(args)
