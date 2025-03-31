build:
	docker compose build
run:
	docker compose up -d
stop:
	docker compose stop
bash:
	docker compose exec -it django-web bash