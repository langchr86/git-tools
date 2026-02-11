#! /bin/bash -e

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

distro=${1:-ubuntu-noble}

docker build --rm --file=${SCRIPT_DIR}/Dockerfile.${distro} --tag=${distro}:ansible .

docker rm -f test-container
docker run \
  --detach \
  --privileged \
  --volume="${SCRIPT_DIR}/../":/etc/ansible/roles/git-tools:ro \
  --name=test-container \
  ${distro}:ansible
