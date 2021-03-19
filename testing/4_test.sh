#! /bin/bash -e

idempotence=$1

echo "Running syntax checks"
env ANSIBLE_FORCE_COLOR=1 ansible-playbook /etc/ansible/roles/git-tools/testing/playbook.yml --syntax-check

echo "Running playbook"
env ANSIBLE_FORCE_COLOR=1 ansible-playbook /etc/ansible/roles/git-tools/testing/playbook.yml

if [ "${idempotence}" = "--idempotence" ]; then
echo "Running playbock again and test Idempotence"
env ANSIBLE_FORCE_COLOR=1 ansible-playbook /etc/ansible/roles/git-tools/testing/playbook.yml \
    | grep -q 'changed=0.*failed=0' \
    && (echo 'Idempotence test: pass' && exit 0) || (echo 'Idempotence test: fail' && exit 1)
fi
