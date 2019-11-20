#! /bin/sh

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
NAME="test-env"

docker build \
  --tag ${NAME} \
  ${SCRIPT_DIR}

docker stop ${NAME}
docker rm ${NAME}

docker create \
  --privileged \
  --volume ${HOME}/.ssh:/home/tester/.ssh:ro \
  --volume ${SCRIPT_DIR}/../:/home/tester/git-tools:ro \
  --publish 2201:22 \
  --name ${NAME} \
  ${NAME}

docker restart ${NAME}
