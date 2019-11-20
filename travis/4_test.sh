#! /bin/sh

env ANSIBLE_FORCE_COLOR=1 ansible-playbook -v /etc/ansible/roles/git-tools/travis/test.yml --syntax-check

env ANSIBLE_FORCE_COLOR=1 ansible-playbook -v /etc/ansible/roles/git-tools/travis/test.yml

env ANSIBLE_FORCE_COLOR=1 ansible-playbook -v /etc/ansible/roles/git-tools/travis/test.yml \
    | grep -q 'changed=0.*failed=0' \
    && (echo 'Idempotence test: pass' && exit 0) || (echo 'Idempotence test: fail' && exit 1)
