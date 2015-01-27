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

<<<<<<< Updated upstream
ansible-playbook -u $USER -i local_inventory dev_playbook.yml
=======
<<<<<<< Updated upstream
sudo ansible-playbook -u $USER -i local_inventory dev_playbook.yml
=======
ansible-playbook -u $USER -i local_inventory -K dev_playbook.yml
>>>>>>> Stashed changes
>>>>>>> Stashed changes
