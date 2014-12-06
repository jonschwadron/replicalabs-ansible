# Replica Labs Setup with Chef #

Make sure the virtual machine have at least 2 GB memory allocated, otherwise the setup will fail.  

## To-do: ##
Rewrite recipes for the following cookbooks:

*  replicalabs::repo
*  optimus

Rewrite recipes for the following cookbooks:

*  create an installation script that will perform the commands below.


## Install Chef ##
```
wget https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.3.5-1_amd64.deb
```
```
sudo dpkg -i chefdk_0.3.5-1_amd64.deb
```

## Clone this repository into the chef-repo folder ##
```
git clone [url] chef-repo
```

## Configure knife.rb ##
```
mkdir .chef
```
```
echo "cookbook_path ['~/chef-repo/cookbooks', '~/chef-repo/berkshelf']
chef_repo_path ['~/chef-repo']" > ~/.chef/knife.rb
```

## Start the setup ##
```
sudo chef-client -z
```