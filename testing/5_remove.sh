#! /bin/bash -e

container_id=${1:-/tmp/git-tools-docker-id}

docker rm -f test-container

docker image prune --force
