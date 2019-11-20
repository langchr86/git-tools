#! /bin/sh

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

distribution=${1:-ubuntu}
version=${2:-bionic}

docker pull ${distribution}:${version}
docker build --no-cache --rm --file=${SCRIPT_DIR}/Dockerfile.${distribution}-${version} --tag=${distribution}-${version}:ansible .
