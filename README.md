# Replica Labs Setup with Ansible #

Make sure your virtual machine have at least 2 GB memory allocated, otherwise the setup will fail.  

## To-do: ##
*  Create a script to install/configure ansible
*  Convert Chef recipes into Ansible playbooks

## To run the setup: ##
```
git clone [https url] replica_labs
```

```
cd replica_labs
sudo bash setup.sh
```

## To run a single script ##

create a new file called test.yml in the same directory where the hosts file is. here is a sample code:

```
---
  - hosts: local
  tasks:
    - name: install python-pip
      apt: name=python-pip state=installed
```

save the file and run the script:
`sudo ansible-playbook -i hosts test.yml`
