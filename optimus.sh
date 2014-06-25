#!/bin/bash
set -e
set -u

# Because the laptops are enabled with NVIDIA OPTIMUS, we need to
# install extra software to deal with the "power savings".
sudo add-apt-repository ppa:bumblebee/stable
sudo add-apt-repository ppa:ubuntu-x-swat/x-updates
sudo apt-get update
sudo apt-get install bumblebee bumblebee-nvidia linux-headers-generic primus primus-libs

# The second driver is run from the 'bumblebee' group, so we need to join it.
sudo gpasswd -a $(whoami) bumblebee

echo "Now you need to configure your /etc/bumblebee/bumblebee.conf. Please see https://wiki.ubuntu.com/Bumblebee#Installation for more instructions."
