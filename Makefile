bash:
	docker exec -it pythoncontainer bash
launch: docker-compose up -d
clean: docker compose down --rmi