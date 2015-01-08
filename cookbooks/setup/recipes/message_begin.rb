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

def message_start
  
  line = Hash.new
  line[1] = "Starting Replica Labs setup..."

  fps=30
  delay = 1.0/fps

  for i in 1..line.size do
    for j in 1..line[i].length do
      print line[i][((j+=1)-2) % line[i].length]
      sleep delay
    end
  end
end

def show_wait_cursor(seconds,fps=10)

  chars = %w[| / - \\]
  delay = 1.0/fps
  (seconds*fps).round.times{ |i|
    print chars[i % chars.length]
    sleep delay
    print "\b"
  }
end

def message_rendor

  login_name = Etc.getlogin
  
  line = Hash.new
  line[1] = "Rendor: How are you gentleman!!"
  line[2] = "Rendor: All your base are belong to us."
  line[3] = "\n", login_name, ": What you say?!\n"
  line[4] = "Rendor: I... uh..."
  line[5] = "Rendor: The setup will take approximately an hour to finish."
  line[6] = "Rendor: Let's generate your SSH key."

  fps = 30
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
message_start
show_wait_cursor(3)
puts "\n\n"
message_rendor
puts "\n"