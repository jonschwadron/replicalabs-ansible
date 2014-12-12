#                 _ _           _       _
#  _ __ ___ _ __ | (_) ___ __ _| | __ _| |__  ___
# | '__/ _ \ '_ \| | |/ __/ _` | |/ _` | '_ \/ __|
# | | |  __/ |_) | | | (_| (_| | | (_| | |_) \__ \
# |_|  \___| .__/|_|_|\___\__,_|_|\__,_|_.__/|___/
#          |_|
#
# Copyright 2014, Replica Labs
# All rights reserved - Do Not Redistribute

#require 'etc'
#username = Etc.getlogin

SOURCE_DIRECTORY = File.join(Dir.home)

require 'etc'
username = Etc.getlogin

%w{
  meshify-superbuild
  rendor-android-superbuild
  Server
    }.each do |other_repo|    

    git "#{SOURCE_DIRECTORY}" do
        repository "git@bitbucket.org:replicalabs/#{other_repo}"
        revision "master"
        user "#{username}"
        action :checkout
    end
end

=begin

%w{
	miniglog
	GLConsole
	Sophus
	Pangolin
	Calibu
	HAL
	SceneGraph
	Node
	Kangaroo
	}.each do |repo|	

		git "#{SOURCE_DIRECTORY}" do
			repository "git@bitbucket.org:replicalabs/#{repo}"
			revision "master"
			action :sync
		end

		directory "#{SOURCE_DIRECTORY}/#{repo}/build" do
			owner 'root'
			group 'root'
			mode 0755
		end

		case repo
		when "Sohpus"
			bash 'Install Sophus' do
	   	cwd #{SOURCE_DIRECTORY}/#{repo}/build
	   	code <<-EOH
	   		make .. -DCMAKE_INSTALL_PREFIX=$SRC_DIR/install -DBUILD_TESTS=OFF
	   		make -j4 install
	   	EOH
	   end

	 when "HAL"
	 	bash 'Install HAL' do
	  	cwd #{SOURCE_DIRECTORY}/#{repo}/build
	  	code <<-EOH
	  		cmake .. -DCMAKE_INSTALL_PREFIX=$SRC_DIR/install -DBUILD_APPLICATIONS=OFF
	  		make -j4 install
	  	EOH
	  end

	when "Kangaroo"
		bash 'Install Kangaroo' do
	  	cwd #{SOURCE_DIRECTORY}/#{repo}/build
	  	code <<-EOH
	  		cmake .. -DCMAKE_INSTALL_PREFIX=$SRC_DIR/install -DBUILD_APPLICATIONS=OFF
	  		make -j4 install
	  	EOH
	  end

	else
		bash 'Install' do
	  	cwd #{SOURCE_DIRECTORY}/#{repo}/build
	  	code <<-EOH
	  		ccmake .. -DCMAKE_INSTALL_PREFIX=$SRC_DIR/install
	  		make -j4 install
	  	EOH
	  end
	end
end
=end
