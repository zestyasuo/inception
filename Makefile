
DB_DIR_PATH = /home/zyasuo/data/db
WP_DIR_PATH = /home/zyasuo/data/website/wordpress
WEBSITE_DIR_PATH = /home/${USER}/data/website
ADMINER_DIR_PATH = /home/${USER}/data/website/adminer

all:	up

DB_DIR:
	mkdir -p ${DB_DIR_PATH}

WP_DIR:
	mkdir -p ${WP_DIR_PATH}

WEBSITE_DIR :
	mkdir -p ${WEBSITE_DIR_PATH}

ADMINER_DIR:
	mkdir -p ${ADMINER_DIR_PATH}

up: | WEBSITE_DIR DB_DIR WP_DIR ADMINER_DIR
		docker-compose -f srcs/docker-compose.yml up #-d

down:
		docker-compose -f srcs/docker-compose.yml down

ps:
		docker-compose -f srcs/docker-compose.yml ps


fclean:	down
		docker rmi -f $$(docker images -qa);\
		docker volume rm $$(docker volume ls -q);\
		docker system prune -a --force
		sudo rm -Rf ${DB_DIR_PATH}
		sudo rm -Rf ${WP_DIR_PATH}

re: fclean all
