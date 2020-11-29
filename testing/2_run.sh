#! /bin/sh

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

distro=${1:-ubuntu-focal}
container_id=${2:-/tmp/git-tools-docker-id}

docker run \
  --detach \
  --privileged \
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
  --volume="${SCRIPT_DIR}/../":/etc/ansible/roles/git-tools:ro \
  ${distro}:ansible > "${container_id}"
