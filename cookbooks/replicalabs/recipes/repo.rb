#                 _ _           _       _
#  _ __ ___ _ __ | (_) ___ __ _| | __ _| |__  ___
# | '__/ _ \ '_ \| | |/ __/ _` | |/ _` | '_ \/ __|
# | | |  __/ |_) | | | (_| (_| | | (_| | |_) \__ \
# |_|  \___| .__/|_|_|\___\__,_|_|\__,_|_.__/|___/
#          |_|
#
# Copyright 2014, Replica Labs
# All rights reserved - Do Not Redistribute

SOURCE_DIRECTORY = File.join(Dir.home)

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
	  		code <<-EOH
			  	cmake .. -DCMAKE_INSTALL_PREFIX=$SRC_DIR/install -DBUILD_TESTS=OFF
				make -j4 install
			EOH
		end

	when "HAL"
	  	bash 'Install HAL' do
	  		code <<-EOH
			  	cmake .. -DCMAKE_INSTALL_PREFIX=$SRC_DIR/install -DBUILD_APPLICATIONS=OFF
	    		make -j4 install
			EOH
		end

	when "Kangaroo"
	  	bash 'Install Kangaroo' do
	  		code <<-EOH
			  	cmake .. -DCMAKE_INSTALL_PREFIX=$SRC_DIR/install -DBUILD_APPLICATIONS=OFF
	    		make -j4 install
			EOH
		end

	else
	  	bash 'Install' do
	  		code <<-EOH
			  	ccmake .. -DCMAKE_INSTALL_PREFIX=$SRC_DIR/install
        		make -j4 install
			EOH
		end
	end
end

%w{
	iDTAM
	VideoUploader
	rendor-02
	Server
	meshify
	}.each do |other_repo|	

  git "#{SOURCE_DIRECTORY}" do
    repository "git@bitbucket.org:replicalabs/#{other_repo}"
    action :sync 
  end
end


