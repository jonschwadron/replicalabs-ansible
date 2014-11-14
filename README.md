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

Command to run the setup:
-----------------
```
chef-client --local-mode --runlist 'recipe[setup]'
```

To create a cookbook:
-----------------
```
knife cookbook create examplecookbook
```