nginx: 
	cd srcs/ ; docker-compose up -d

maria:
	cd srcs/ ; docker-compose up -d

wordpress:
	cd srcs/ ; docker-compose up -d


up:
	docker-compose up -d
down:
	docker-compose down
clean:
	down
	docker rmi $(docker images -a -q)

ls:
	docker images
	docker ps

