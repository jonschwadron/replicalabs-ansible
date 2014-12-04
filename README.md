# Replica Labs Setup with Chef #

## To-do: ##
Rewrite recipes for the following cookbooks:

*  linux
*  replicalabs::repo
*  optimus


## Install Chef ##
```
wget https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.3.5-1_amd64.deb
```
```
sudo dpkg -i chefdk_0.3.5-1_amd64.deb
```

## Create a folder named 'chef-repo' and clone this repository into the folder ##
```
git clone [url] chef-repo
```

## Add the following cookbook paths to knife.rb ##
```
echo "cookbook_path ['~/chef-repo/cookbooks', '~/chef-repo/berkshelf']
chef_repo_path ['~/chef-repo']" > ~/.chef/knife.rb
```

## Run the following command to start the setup ##
```
cd chef-repo
sudo chef-client -z
```