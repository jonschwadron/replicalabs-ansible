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

sudo ansible-playbook -i hosts site.yml
