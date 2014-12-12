#                 _ _           _       _
#  _ __ ___ _ __ | (_) ___ __ _| | __ _| |__  ___
# | '__/ _ \ '_ \| | |/ __/ _` | |/ _` | '_ \/ __|
# | | |  __/ |_) | | | (_| (_| | | (_| | |_) \__ \
# |_|  \___| .__/|_|_|\___\__,_|_|\__,_|_.__/|___/
#          |_|
#
# Copyright 2014, Replica Labs
# All rights reserved - Do Not Redistribute
  
require 'etc'

def message

  login_name = Etc.getlogin
  
  line = Hash.new
  line[1] = "Now you need to configure your /etc/bumblebee/bumblebee.conf."
  line[2] = "Please see https://wiki.ubuntu.com/Bumblebee#Installation for more instructions."

  fps = 25
  delay = 1.0/fps

  for i in 1..line.size do
    for j in 1..line[i].length do
      print line[i][((j+=1)-2) % line[i].length]
      sleep delay
    end
    sleep delay*25
    print "\n"
  end
end

puts "\n"
message
puts "\n"  