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
puts "==================================================="
puts sshkey.ssh_public_key
puts "===================================================\n\n"

def message_rendor

  login_name = Etc.getlogin
  
  line = Hash.new
  line[1] = "Rendor: I have generated your SSH Key."
  line[2] = "Rendor: We need to add it to your bitbucket account."
  line[2] = "Rendor: Go ahead and copy the public key above"
  line[3] = "Rendor: Go to bitbucket.com"
  line[4] = "Rendor: Click the user icon (upper right corner) and click Manage account"
  line[5] = "Rendor: Click SSH keys"
  line[6] = "Rendor: Click Add key and paste your public key."

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

message_rendor

print "\nOnce you added your public key to your account, press enter to continue..."
STDIN.readline