#                 _ _           _       _
#  _ __ ___ _ __ | (_) ___ __ _| | __ _| |__  ___
# | '__/ _ \ '_ \| | |/ __/ _` | |/ _` | '_ \/ __|
# | | |  __/ |_) | | | (_| (_| | | (_| | |_) \__ \
# |_|  \___| .__/|_|_|\___\__,_|_|\__,_|_.__/|___/
#          |_|
#
# Copyright 2014, Replica Labs
# All rights reserved - Do Not Redistribute

#Display messages with spinner

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
  yield.tap{       # After yielding to the block, save the return value
    iter = false   # Tell the thread to exit, cleaning up after itself…
    spinner.join   # …and wait for it to do so.
  }                # Use the block's return value as the method's

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

include_recipe 'linux'
include_recipe 'linux::essentials'
include_recipe 'linux::packages'
include_recipe 'linux::rubyzip'
include_recipe 'replicalabs'
include_recipe 'replicalabs::repo'
include_recipe 'optimus'
#include_recipe 'optimus::bumblebee'
