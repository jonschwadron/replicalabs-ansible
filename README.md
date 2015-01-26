# Replica Labs Setup with Ansible #

In this current version, Ansible will only run the follow script:
*  packages

Make sure your virtual machine have at least 2 GB memory allocated, otherwise the setup will fail.  

## To-do: ##
*  ssh
*  repositories
*  ceres-solver

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
