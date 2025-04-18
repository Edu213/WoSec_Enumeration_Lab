#!/usr/bin/bash

docker rm --force $(docker ps -aq)
docker rmi --force $(docker images -aq)
docker network rm $(docker network ls -q)
docker volume rm $(docker volume ls -q)
docker buildx prune -f

