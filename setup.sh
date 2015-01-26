#!/bin/bash
set -e
set -u

if hash ansible 2>/dev/null; then
  echo -e "\nAnsible detected"
else
  echo -e "\nInstalling Ansible...\n"
  sudo apt-add-repository -y ppa:ansible/ansible
  sudo apt-get update
  sudo apt-get install -y ansible
fi

sudo ansible-playbook -i hosts site.yml
