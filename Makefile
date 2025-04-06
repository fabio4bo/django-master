# use tab for identation
PROJECT_NAME := $(shell grep ^PROJECT_NAME= .env | head -n 1 | cut -d '=' -f2)

upb:
	docker compose up --build

up:
	docker compose up

down:
	docker compose down -v

shell:
	docker compose exec web bash

manage:
	docker compose exec web python manage.py $(CMD)

migrate:
	docker compose exec web python manage.py migrate

createsuperuser:
	docker compose exec web python manage.py createsuperuser

logs:
	docker compose logs -f

ps:
	docker compose ps

print:
	echo $(PROJECT_NAME)
