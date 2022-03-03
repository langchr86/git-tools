#! /bin/bash -e

cd /etc/ansible/roles/git-tools/testing

echo "Linting testing playbook"
ansible-lint
