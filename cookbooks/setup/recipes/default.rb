#                 _ _           _       _
#  _ __ ___ _ __ | (_) ___ __ _| | __ _| |__  ___
# | '__/ _ \ '_ \| | |/ __/ _` | |/ _` | '_ \/ __|
# | | |  __/ |_) | | | (_| (_| | | (_| | |_) \__ \
# |_|  \___| .__/|_|_|\___\__,_|_|\__,_|_.__/|___/
#          |_|
#
# Copyright 2014, Replica Labs
# All rights reserved - Do Not Redistribute

<<<<<<< HEAD
<<<<<<< HEAD
#Display messages with spinner
=======
>>>>>>> c0798e66067003378ba007b6b9a05c3ff371e71d
=======
>>>>>>> c0798e66067003378ba007b6b9a05c3ff371e71d
def show_wait_spinner(fps=10)
  chars = %w[| / - \\]
  delay = 1.0/fps
  iter = 0
  spinner = Thread.new do
    while iter do  # Keep spinning until told otherwise
      print chars[(iter+=1) % chars.length]
      sleep delay
      print "\b"
    end
  end
<<<<<<< HEAD
<<<<<<< HEAD
  yield.tap{
    iter = false
    spinner.join
  }
=======
=======
>>>>>>> c0798e66067003378ba007b6b9a05c3ff371e71d
  yield.tap{       # After yielding to the block, save the return value
    iter = false   # Tell the thread to exit, cleaning up after itself…
    spinner.join   # …and wait for it to do so.
  }                # Use the block's return value as the method's
<<<<<<< HEAD
>>>>>>> c0798e66067003378ba007b6b9a05c3ff371e71d
=======
>>>>>>> c0798e66067003378ba007b6b9a05c3ff371e71d
end

print "\n  Welcome to Replica Labs.   "
show_wait_spinner{
  sleep rand(4)+2 # Simulate a task taking an unknown amount of time
}
print "\n  Go make a sandwich and come back in a little while.   "
show_wait_spinner{
  sleep rand(4)+2 # Simulate a task taking an unknown amount of time
}
print "\n\n"

# Installs all packages and dependencies for Replica Labs libraries. The OpenCV download might hang; if so, download the .zip directly (copy line 33) and rerun the script.
include_recipe 'linux'
<<<<<<< HEAD
<<<<<<< HEAD
include_recipe 'linux::essentials'
include_recipe 'linux::packages'
=======
include_recipe 'linux::rubyzip'
>>>>>>> c0798e66067003378ba007b6b9a05c3ff371e71d
=======
include_recipe 'linux::rubyzip'
>>>>>>> c0798e66067003378ba007b6b9a05c3ff371e71d

#Clones all repositories under the Replica Labs GitHub account. The core libraries are built for you. The rest (iDTAM, VideoUpoader, Rendor, and Server) are merely cloned. Build them as needed.
include_recipe 'replicalabs'
include_recipe 'replicalabs::repo'

#Downloads the Linux ADT bundle in your top directory.
include_recipe 'android'
include_recipe 'android::adt'

#Run this script if your configuration uses NVIDIA OPTIMUS. Extra software must be downloaded to bypass some of the preconfigured settings. When a GPU process is run after this script is executed, start the command line with 'primusrun' to utilize this bypass.
include_recipe 'optimus'
#include_recipe 'optimus::bumblebee'
