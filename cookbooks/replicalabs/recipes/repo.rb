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
username = Etc.getlogin

SOURCE_DIRECTORY = File.join(Dir.home)
REPLICALABS_REPO = ['meshify-superbuild', 'rendor-android-superbuild']

(REPLICALABS_REPO).each do |repo|    
    git "#{SOURCE_DIRECTORY}/#{repo}" do
      repository "git@bitbucket.org:replicalabs/#{repo}"
      revision "master"
      user "#{username}"
      action :checkout
    end
end