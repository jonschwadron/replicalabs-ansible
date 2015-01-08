#!/bin/bash
set -e
set -u

#chefdk versions and file name
CHEF_VERSION="11.18.0.rc.1"
CHEFDK_FILE="chefdk_0.3.5-1_amd64.deb"
CHEFDK_SOURCE="https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/"${CHEFDK_FILE}

#bash script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#chef directories
CHEF_CONFIG_DIRECTORY=~/.chef
BERKSFILE_SOURCE=${SCRIPT_DIR}/cookbooks/setup
BERKSHELF_DIRECTORY=${SCRIPT_DIR}/berkshelf
BERKSHELF_SETUP_DIRECTORY=${SCRIPT_DIR}/berkshelf/setup

if hash chef-client 2>/dev/null; then
    printf "\nChefDK is currently installed. Validating ChefDK."
else
	echo "\nChefDK not found, installing..."
  wget ${CHEFDK_SOURCE}
  sudo dpkg -i ${CHEFDK_FILE}
fi

CHEF_CURRENT_VERSION="$( chef-client -v | perl -nE 'say /Chef: (.*)/')"

if [ $CHEF_CURRENT_VERSION != $CHEF_VERSION ]; then
  printf "\nChefDK is outdated. Performing update..."
  wget ${CHEFDK_SOURCE}
  sudo dpkg -i ${CHEFDK_FILE}
  printf "\nChefDK is up to date!\n"
else
  printf "\nChefDK is up to date!\n"
fi

# create chef cookbook directory
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

#remove setup folder inside the berkshelf folder to avoid duplicate warning messages
if [ -d $BERKSHELF_SETUP_DIRECTORY ]; then
  cd ${BERKSHELF_DIRECTORY}
  sudo rm -rf setup
fi

# start chef-client in local mode
sudo chef-client -z