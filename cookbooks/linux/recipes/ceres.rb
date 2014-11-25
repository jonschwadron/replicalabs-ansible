#                 _ _           _       _
#  _ __ ___ _ __ | (_) ___ __ _| | __ _| |__  ___
# | '__/ _ \ '_ \| | |/ __/ _` | |/ _` | '_ \/ __|
# | | |  __/ |_) | | | (_| (_| | | (_| | |_) \__ \
# |_|  \___| .__/|_|_|\___\__,_|_|\__,_|_.__/|___/
#          |_|
#
# Copyright 2014, Replica Labs
# All rights reserved - Do Not Redistribute

CERES_DIRECTORY = File.join(Dir.home, "ceres-solver")
#CERES_BUILD_DIRECTORY = File.join(Dir.home, "ceres-solver/build")

directory "#{CERES_DIRECTORY}" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

git "#{CERES_DIRECTORY}" do
  repository "https://ceres-solver.googlesource.com/ceres-solver"
  revision '1.8.0'
  action :sync
  not_if { ::File.exists?(CERES_DIRECTORY) }
end

bash 'install ceres-solver' do
  cwd "#{CERES_DIRECTORY}"
  code <<-EOH
    mkdir -p build &&
    cd build &&
    cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS:BOOL=ON &&
    make -j4 install
  EOH
end
