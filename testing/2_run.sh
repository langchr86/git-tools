#! /bin/sh

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

distribution=${1:-ubuntu}
version=${2:-bionic}
container_id=${3:-/tmp/git-tools-docker-id}

docker run \
  --detach \
  --privileged \
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
  --volume="${SCRIPT_DIR}/../":/etc/ansible/roles/git-tools:ro \
  ${distribution}-${version}:ansible > "${container_id}"
