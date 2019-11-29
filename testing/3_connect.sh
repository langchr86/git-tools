#! /bin/sh

container_id=${1:-/tmp/git-tools-docker-id}

docker exec -it "$(cat ${container_id})" /bin/sh
