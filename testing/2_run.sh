#! /bin/bash -e

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

distro=${1:-ubuntu-focal}

docker run \
  --detach \
  --privileged \
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
  --volume="${SCRIPT_DIR}/../":/etc/ansible/roles/git-tools:ro \
  --name=test-container \
  ${distro}:ansible
