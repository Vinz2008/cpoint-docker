#!/bin/bash
set -ex

docker stop docker_dev
docker rm docker_dev
DOCKER_IMAGE=$(docker images | tail -n +2 | head -n 1 | cut -d " " -f12)
docker run -it -d --name docker_dev $DOCKER_IMAGE bash
docker exec -it docker_dev /bin/bash
docker stop docker_dev
docker rm docker_dev