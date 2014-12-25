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

puts "This is your public key:"
puts "\n\n==================================================="
puts sshkey.ssh_public_key
puts "===================================================\n\n"