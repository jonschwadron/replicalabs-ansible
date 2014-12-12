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



=begin
#use below for chef server

# Store private key on disk
template pkey do
  source "id_rsa.erb"
  owner 'root'
  variables(ssh_private_key: sshkey.private_key)
  mode 00600
  action :create_if_missing
end

# Store public key on disk
template "#{pkey}.pub" do
  source "id_rsa.pub.erb"
  owner 'root'
  variables(ssh_public_key: sshkey.ssh_public_key)
  mode 00644
  action :create_if_missing
end

# Store private key on disk
template pkey do
  owner node['jenkins']['master']['user']
  group node['jenkins']['master']['group']
  variables(ssh_private_key: sshkey.private_key)
  mode 00600
  action :create_if_missing
end

# Store public key on disk
template "#{pkey}.pub" do
  owner node['jenkins']['master']['user']
  group node['jenkins']['master']['group']
  variables(ssh_public_key: sshkey.ssh_public_key)
  mode 00644
  action :create_if_missing
end

# Save public key to chef-server as jenkins_pubkey 
ruby_block 'node-save-pubkey' do
  block do
    node.set_unless['jenkins_pubkey'] = File.read("#{pkey}.pub")
    node.save unless Chef::Config['solo']
end
=end