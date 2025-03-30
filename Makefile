build:
	docker build -t django-docker .
run:
	docker run -it --rm --name my-running-script -v "$PWD":/usr/src/myapp -w /usr/src/myapp python:3 python your-daemon-or-script.py
bash:
	docker exec -it -u walter django_container bash 
root:
	docker exec -it django_container bash
start:
	docker start django_container
stop:
	docker stop django_container
rm:
	docker rm django_container
rmi:
	docker image rm alpine:3.21
clean: rm rmi
deleteandrebuild: stop clean build run start
launch: build run start
launchwithrepos: buildwithrepos run start