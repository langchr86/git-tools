#! /bin/bash -e

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
cd ${SCRIPT_DIR}

docker build --rm --tag=ansible-lint .

docker run \
  --rm \
  -v ${SCRIPT_DIR}/../testing:/testing:ro \
  ansible-lint \
  ansible-lint --exclude /root/.cache \
    /testing/playbook.yml
