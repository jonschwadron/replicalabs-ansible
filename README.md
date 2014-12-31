# Replica Labs Setup with Chef #

Make sure the virtual machine have at least 2 GB memory allocated, otherwise the setup will fail.  

## To-do: ##

*  create a ruby code to halt the chef-dk process after running SSH-KEY recipe and then prompt the user to add his/her SSH key into the bitbucket account. 
*  Update CHANGELOG.md
*  Check out put of chef-client and validate the version of it.
*  Update README.md
*  Finish the documentation

## Clone this repository into the chef-repo folder ##
```
git clone [https url] chef-repo
```

## Run setup.sh ##
```
cd chef-repo
sudo bash setup.sh
```