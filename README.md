Replica Labs Setup with Chef
====================================

To-do:
-----------------
Rewrite recipes for the following cookbooks:

1. linux
2. optimus
3. replicalabs::repo

Install Chef
----------------
```
$ wget http://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.3.2-1_amd64.deb
```
```
$ sudo dpkg -i chefdk_0.3.2-1_amd64.deb
```

Configure knife.rb
----------------
```
$ cd .chef
/.chef$ nano knife.rb
```
Add the following content:
```
cookbook_path [ '~/chef-repo/cookbooks' ]
```
Save and exit.

Clone this Repository and run the following command to start the setup:
-----------------
```
chef-client --local-mode --runlist 'recipe[setup]'
```