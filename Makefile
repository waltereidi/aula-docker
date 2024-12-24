build:
	docker build --build-arg USERNAME=walter --build-arg UID=1000 --build-arg GID=1000 -t debian12 .
run:
	docker run -d \
	-p 8000:8000 \
	-p 8001:8001 \
	-p 5432:5432 \
	-p 5173:5173 \
	--volume=./back:/var/www/back \
	--volume=./front:/var/www/front \
	--volume=./docker/back.conf:/etc/nginx/sites-available/back.conf \
	--volume=./docker/front.conf:/etc/nginx/sites-available/front.conf \
	--name meu_container debian12 \
	--extra_hosts = host.docker.internal:host-gateway
bash:
	docker exec -it -u walter meu_container bash 
root:
	docker exec -it meu_container bash
start:
	docker start meu_container
stop:
	docker stop meu_container
rm:
	docker rm meu_container
rmi:
	docker image rm debian12
clean: rm rmi
restart: stop clean build run start
launch: build run start
