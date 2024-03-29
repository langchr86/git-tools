#! /bin/sh

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
cd ${SCRIPT_DIR}

ansible-playbook \
  --connection=local \
  --inventory 127.0.0.1, \
  --limit 127.0.0.1 \
  --extra-vars 'ansible_python_interpreter=/usr/bin/python3' \
  --ask-become-pass \
  testing/playbook.yml
