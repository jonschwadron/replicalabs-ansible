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

git "#{CERES_DIRECTORY}" do
  repository "https://ceres-solver.googlesource.com/ceres-solver"
  revision '1.8.0'
  action :sync
end

%W[ #{CERES_DIRECTORY} #{CERES_DIRECTORY}/build ].each do |path|
  directory path do
    owner 'root'
    group 'root'
    mode '0755'
  end
end

bash 'install ceres-solver' do
  cwd "#{CERES_DIRECTORY}/build"
  code <<-EOH
    cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS:BOOL=ON &&
    make -j4 install
  EOH
end