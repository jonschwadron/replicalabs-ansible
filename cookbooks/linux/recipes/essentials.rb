#                 _ _           _       _
#  _ __ ___ _ __ | (_) ___ __ _| | __ _| |__  ___
# | '__/ _ \ '_ \| | |/ __/ _` | |/ _` | '_ \/ __|
# | | |  __/ |_) | | | (_| (_| | | (_| | |_) \__ \
# |_|  \___| .__/|_|_|\___\__,_|_|\__,_|_.__/|___/
#          |_|
#
# Copyright 2014, Replica Labs
# All rights reserved - Do Not Redistribute

chef_gem 'rubyzip' do
  action :install
end

execute "install cookbooks and dependencies" do
  command "berks install"
  action :run
end


=begin
execute "Generate a Berksfile in a pre-existing cookbook"
  command "berks init ."
  action :run
end

execute "install berkshelf" do
  command "cookbook 'opencv', '~> 0.0.6'"
  action :run
end
=end
