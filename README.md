# Replica Labs Setup with Chef #

## To-do: ##
Rewrite recipes for the following cookbooks:

*  linux
*  replicalabs::repo
*  optimus


## Install Chef ##
```
$ wget http://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.3.2-1_amd64.deb
```
```
$ sudo dpkg -i chefdk_0.3.2-1_amd64.deb
```

## Clone this Repository and run the following command to start the setup: ##
```
chef-client --local-mode --runlist 'recipe[setup]'
```