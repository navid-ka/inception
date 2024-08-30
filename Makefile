all:
	cd srcs; docker-compose up --build -d

nginx:
	cd srcs/requirements/nginx; docker build . -t nginx; docker run -d nginx

mariadb:
	cd srcs/requirements/mariadb; docker build . -t mariadb; docker run -it mariadb bash

wordpress:
	cd srcs/requirements/wordpress; docker build . -t wordpress; docker run -it wordpress bash

network:
	docker network ls

ls :
	docker ps
clean:
	@if [ ! -z "$$(docker ps -aq)" ]; then \
		docker stop $$(docker ps -aq); \
		docker rm $$(docker ps -aq); \
	fi
	@if [ ! -z "$$(docker images -aq)" ]; then \
		docker rmi $$(docker images -aq); \
	fi	
	@if [ ! -z "$$(docker volume ls -q)" ]; then \
		docker volume rm $$(docker volume ls -q); \
	fi
	@if [ ! -z "$$(docker network ls -q --filter type=custom)" ]; then \
		docker network rm $$(docker network ls -q --filter type=custom); \
	fi
	rm -rf /home/$(USER)/data/wordpress
	rm -rf /home/$(USER)/data/mariadb
	@echo "$(GREEN)Deleted all docker containers, volumes, networks, and images succesfully$(END)"
