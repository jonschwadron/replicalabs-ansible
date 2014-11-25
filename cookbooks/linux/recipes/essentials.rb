#                 _ _           _       _
#  _ __ ___ _ __ | (_) ___ __ _| | __ _| |__  ___
# | '__/ _ \ '_ \| | |/ __/ _` | |/ _` | '_ \/ __|
# | | |  __/ |_) | | | (_| (_| | | (_| | |_) \__ \
# |_|  \___| .__/|_|_|\___\__,_|_|\__,_|_.__/|___/
#          |_|
#
# Copyright 2014, Replica Labs
# All rights reserved - Do Not Redistribute

BERKS_DIRECTORY = File.join(Dir.home, "chef-repo/cookbooks/linux/berks-cookbooks")

chef_gem 'rubyzip' do
  action :install
end

execute 'berks-vendor' do
  command "cd ~/chef-repo/cookbooks/linux && berks vendor"
  action :run
  not_if { ::File.exists?(BERKS_DIRECTORY) }
end
