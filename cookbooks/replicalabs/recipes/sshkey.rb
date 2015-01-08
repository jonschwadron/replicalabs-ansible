#                 _ _           _       _
#  _ __ ___ _ __ | (_) ___ __ _| | __ _| |__  ___
# | '__/ _ \ '_ \| | |/ __/ _` | |/ _` | '_ \/ __|
# | | |  __/ |_) | | | (_| (_| | | (_| | |_) \__ \
# |_|  \___| .__/|_|_|\___\__,_|_|\__,_|_.__/|___/
#          |_|
#
# Copyright 2014, Replica Labs
# All rights reserved - Do Not Redistribute

require 'sshkey'

ssh_directory = File.join(Dir.home, ".ssh")
pkey = File.join(Dir.home, ".ssh/id_rsa")

#create ~/.ssh directory
directory "#{ssh_directory}" do
  action :create
end

puts "\nGenerating public/private rsa key pair."

#ruby generate sshkey
#documentation: http://www.rubydoc.info/gems/sshkey/1.6.1/frames
if File.exists?(pkey)
  sshkey = SSHKey.new(File.read("#{pkey}"))
else
  sshkey = SSHKey.generate(
    type: 'RSA',
    comment: "",
    )
end

#store private key
file pkey do
  content sshkey.private_key
  action :create_if_missing
end

#store public key
file "#{pkey}.pub" do
  content sshkey.ssh_public_key
  action :create_if_missing
end

puts "\n\nThis is your public key:"
puts "---------------------------------------------------"
puts sshkey.ssh_public_key
puts "---------------------------------------------------\n\n"

def message_rendor

  login_name = Etc.getlogin
  
  line = Hash.new
  line[1] = "Rendor: Please add your SSH Key to your bitbucket account"
  line[2] = "Rendor: Copy the key given above by highlighting, right click and click copy"
  line[3] = "Rendor: Do not use Ctrl+C to copy, it will halt the setup"
  line[4] = "Rendor: Log in at bitbucket.com"
  line[5] = "Rendor: Click the user icon (upper right corner)"
  line[6] = "Rendor: Click Manage account"
  line[7] = "Rendor: Click SSH keys"
  line[8] = "Rendor: Click Add key" 
  line[9] = "Rendor: Paste your public key"

  fps = 30
  delay = 1.0/fps

  for i in 1..line.size do
    for j in 1..line[i].length do
      print line[i][((j+=1)-2) % line[i].length]
      sleep delay
    end
    sleep delay*20
    print "\n"
  end
end

message_rendor

print "\nOnce you've added your public key to your account, press enter to continue..."
STDIN.readline