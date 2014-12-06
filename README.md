# Replica Labs Setup with Chef #

## To-do: ##
Rewrite recipes for the following cookbooks:

*  `replicalabs::repo`
*  `optimus`

Rewrite recipes for the following cookbooks:

*  `create an installation script that will perform the commands below.`
*  `create an update script that will check/perform updates.`

Note: Unity (Ubuntu's user interface) breaks after installing apt_packages. It does not load after you restart ubuntu and login. Will look into this. 

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