build:
	docker compose build
run:
	docker compose up -d
stop:
	docker compose stop
bash:
	docker compose exec -it django-web bash
runserver:
	docker compose run django-web python manage.py runserver 0.0.0.0:8000