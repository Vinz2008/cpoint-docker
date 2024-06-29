#!/bin/bash
set -ex

docker build -f Dockerfile.ubuntu . --builder arm --load