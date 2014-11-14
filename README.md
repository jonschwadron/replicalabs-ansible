Replica Labs Setup with Chef
====================================

To-do:
-----------------
Rewrite recipes for the following cookbooks:
linux
optimus
replicalabs::repo

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

