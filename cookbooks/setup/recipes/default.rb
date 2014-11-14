#                 _ _           _       _         
#  _ __ ___ _ __ | (_) ___ __ _| | __ _| |__  ___ 
# | '__/ _ \ '_ \| | |/ __/ _` | |/ _` | '_ \/ __|
# | | |  __/ |_) | | | (_| (_| | | (_| | |_) \__ \
# |_|  \___| .__/|_|_|\___\__,_|_|\__,_|_.__/|___/
#          |_|                                    
#
# Copyright 2014, Replica Labs
# All rights reserved - Do Not Redistribute

# Installs all packages and dependencies for Replica Labs libraries. The OpenCV download might hang; if so, download the .zip directly (copy line 33) and rerun the script.
#include_recipe 'linux'

#Clones all repositories under the Replica Labs GitHub account. The core libraries are built for you. The rest (iDTAM, VideoUpoader, Rendor, and Server) are merely cloned. Build them as needed.
#include_recipe 'replicalabs::repo'

#Downloads the Linux ADT bundle in your top directory.
include_recipe 'android'
include_recipe 'android::adt'

#Run this script if your configuration uses NVIDIA OPTIMUS. Extra software must be downloaded to bypass some of the preconfigured settings. When a GPU process is run after this script is executed, start the command line with 'primusrun' to utilize this bypass.
#include_recipe 'optimus'
