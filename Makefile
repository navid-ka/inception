all:	vol
	@docker compose -f ./srcs/docker-compose.yml up -d --build
down:
	@docker compose -f ./srcs/docker-compose.yml down

vol:
	sudo mkdir -p /home/nkeyani-/data/mariadb
	sudo mkdir -p /home/nkeyani-/data/wordpress
	sudo chmod -R 777 /home/nkeyani-/data/
	sudo chown -R nkeyani- /home/nkeyani-/data/

clean:
	sudo rm -rf /home/nkeyani-/data/mysql/*
	sudo rm -rf /home/nkeyani-/data/wordpress/*
	@docker stop $$(docker ps -qa);
	@docker rm $$(docker ps -qa);
	@docker rmi -f $$(docker images -qa);
	@docker volume rm $$(docker volume ls -q);
	@docker network rm nkeyani_net;

status:
	@docker ps -a
prune: 
	docker system prune --volumes -a
re: clean all

.PHONY: all down clean re status vol
