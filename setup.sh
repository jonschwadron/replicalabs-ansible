#!/bin/bash
set -e
set -u

#bash script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#chefdk
CHEFDK_SOURCE="https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.3.5-1_amd64.deb"
CHEFDK_FILE="chefdk_0.3.5-1_amd64.deb"

#chef directories
CHEF_CONFIG_DIRECTORY=~/.chef
BERKSFILE_SOURCE=${SCRIPT_DIR}/cookbooks/setup
BERKSHELF_DIRECTORY=${SCRIPT_DIR}/berkshelf
BERKSHELF_SETUP_DIRECTORY=${SCRIPT_DIR}/berkshelf/setup

if [ -f $CHEFDK_FILE ]; then
  #check current version of Chef DK
  chef-client -v
else
  # Download and unpackage Chef Development Kit
  wget ${CHEFDK_SOURCE}
  sudo dpkg -i ${CHEFDK_FILE}
  chef-client -v
fi

# configure chef cookbook directory
if [ ! -d $CHEF_CONFIG_DIRECTORY ]; then
	mkdir ${CHEF_CONFIG_DIRECTORY}
fi

echo "cookbook_path ['${SCRIPT_DIR}/cookbooks', '${SCRIPT_DIR}/berkshelf']
chef_repo_path ['${SCRIPT_DIR}']" > ~/.chef/knife.rb

#run berks vendor into chef-repo/berkshelf directory
if [ ! -d $BERKSHELF_DIRECTORY ]; then
  cd ${BERKSFILE_SOURCE}
  berks vendor ${BERKSHELF_DIRECTORY}
fi

#remove setup folder inside the berkshelf folder to avoid warning messages
if [ -d $BERKSHELF_SETUP_DIRECTORY ]; then
  cd ${BERKSHELF_DIRECTORY}
  sudo rm -rf setup
fi

# start chef-client in local mode
sudo chef-client -z
