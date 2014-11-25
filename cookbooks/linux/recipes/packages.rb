#                 _ _           _       _
#  _ __ ___ _ __ | (_) ___ __ _| | __ _| |__  ___
# | '__/ _ \ '_ \| | |/ __/ _` | |/ _` | '_ \/ __|
# | | |  __/ |_) | | | (_| (_| | | (_| | |_) \__ \
# |_|  \___| .__/|_|_|\___\__,_|_|\__,_|_.__/|___/
#          |_|
#
# Copyright 2014, Replica Labs
# All rights reserved - Do Not Redistribute

SOURCES_DIRECTORY = File.join(Dir.home, "chef-repo/cookbooks/linux/files")

file "#{SOURCES_DIRECTORY}/sources.list" do
  content ::File.open("/etc/apt/sources.list").read
  action :create
end

execute "update package index" do
  command "apt-get update"
  ignore_failure true
  action :nothing
end.run_action(:run)

#FFMPEGS PACKAGES
%w{
  libavcodec-dev
  libavdevice-dev
  libavfilter-dev
  libavformat-dev
  libavutil-dev
  libpostproc-dev
  libswscale-dev
}.each do |pkg|
  apt_package pkg do
    action :upgrade
  end
end

#CERES PACKAGES
%w{
  libatlas-base-dev
  libgflags-dev
  libgoogle-glog-dev
  libsuitesparse-dev
}.each do |pkg|
  apt_package pkg do
    action :upgrade
  end
end

#PYTHON PACKAGES
%w{
  pep8
  pyflakes
  python-pip
}.each do |pkg|
  apt_package pkg do
    action :upgrade
  end
end

#DB PACKAGES
%w{
  libmysqlclient-dev
  mysql-common
}.each do |pkg|
  apt_package pkg do
    action :upgrade
  end
end

#OTHER PACKAGES
%w{
  ant
  autoconf
  automake
  build-essential
  bzr
  ccache
  checkstyle
  cmake
  cmake-curses-gui
  cppcheck
  cppcheck glew-utils
  default-jdk
  doxygen
  emacs24
  findbugs
  freeglut3
  freeglut3 freeglut3-dev
  freeglut3-dev
  g++
  g++-4.6
  g++-4.8
  gcc
  gcc-4.6
  gcc-4.8
  git
  git-core
  git-gui
  git-svn
  gitk
  gnome-session-flashback
  gnome-tweak-tool
  graphviz
  htop
  lcov
  libavahi-client-dev
  libavahi-compat-libdnssd-dev
  libblas-dev
  libblas3gf
  libboost1.54-all-dev
  libcppunit-dev
  libeigen3-dev
  libgl1-mesa-glx
  libglew-dev
  libglu1-mesa
  libglu1-mesa-dev
  liblapack-dev
  libncurses5-dev
  libpng12-dev
  libprotobuf-c0
  libprotobuf-c0-dev
  libprotobuf-dev
  libprotobuf-lite8
  libprotobuf8
  libprotoc-dev
  libtbb-dev
  libtbb2
  libtool
  libuuid1
  libx11-dev
  libxi-dev
  libxmu-dev
  libzmq3-dev
  linux-headers-generic
  linux-image-generic
  linux-source
  mercurial
  meshlab
  nvidia-cuda-toolkit
  nvidia-current-dev
  nvidia-profiler
  nvidia-visual-profiler
  openssh-client
  openssh-server
  protobuf-compiler
  subversion
  uuid-dev
  valgrind
  xvfb
}.each do |pkg|
  apt_package pkg do
    action :upgrade
  end
end
