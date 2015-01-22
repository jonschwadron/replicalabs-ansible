#!/bin/bash
set -e
set -u

if dpkg -s ansible; then
  echo -e "\nAnsible detected"
else
  echo -e "\nInstalling Ansible...\n"
  sudo apt-add-repository -y ppa:ansible/ansible
  sudo apt-get update
  sudo apt-get install -y ansible
fi

echo "[local]
localhost ansible_connection=local" > /etc/ansible/hosts

sudo ansible-playbook -s package.yml
