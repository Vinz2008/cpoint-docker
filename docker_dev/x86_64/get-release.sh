#!/bin/bash
set -ex

DOCKER_IMAGE=$(docker images | tail -n +2 | head -n 1 | cut -d " " -f12)
docker run -it -d --name docker_dev $DOCKER_IMAGE bash
docker cp docker_dev:/build/cpoint-bin-release.tar.gz .
docker stop docker_dev
docker rm docker_dev