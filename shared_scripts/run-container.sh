#!/bin/bash
set -ex

#DOCKER_IMAGE=$(docker images | tail -n +2 | head -n 1 | cut -d " " -f12)
DOCKER_IMAGE=$(docker images | tail -n +2 | head -n 1 | awk -v FIELDWIDTHS="20 20 20 20 20" '{ print $3 }')
docker run -d --name docker_dev $DOCKER_IMAGE bash
docker exec -it docker_dev /bin/bash
docker stop docker_dev
docker rm docker_dev