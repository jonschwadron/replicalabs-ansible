Replica Labs Setup with Chef
====================================

To-do:
-----------------
Rewrite recipes for the following cookbooks:
1. linux
2. optimus
3. replicalabs::repo

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

