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

include_recipe 'apt'

=begin
apt_repository 'bumblebee' do
  uri 'ppa:bumblebee/stable'
end

apt_repository 'ubuntu-x-swat' do
  uri 'ppa:ubuntu-x-swat/x-updates'
end
=end

%w{
  bumblebee
  bumblebee-nvidia
  primus
  primus-libs
  }.each do |pkg|
  apt_package pkg do
    action :install
  end
end