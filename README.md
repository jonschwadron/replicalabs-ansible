# Replica Labs Setup with Ansible #

In this current version, Ansible includes the following playbooks:

*  packages
*  ssh
*  repositories

Make sure your virtual machine have at least 2 GB memory allocated, otherwise the setup will fail.  

## To-do: ##

*  bumblebee

## To run the setup: ##
```
git clone https://bitbucket.org/replicalabs/replica_setup
```

```
cd replica_setup
./setup.sh
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
`ansible-playbook -i hosts test.yml`

-i inventory

-k requests ssh password

-K requests sudo password

-s uses sudo mode

-u username
