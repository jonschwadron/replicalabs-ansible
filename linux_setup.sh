#!/usr/bin/env bash

SETUP_DIR=~/setup

mkdir $SETUP_DIR

# Get apt-add-repository
sudo apt-get install -y software-properties-common python-software-properties

PACKAGES="cmake git build-essential subversion bzr default-jdk doxygen freeglut3 freeglut3-dev g++-4.7 gcc-4.7 git-core git-gui git-svn gitk graphviz htop libavcodec-dev libavformat-dev libavutil-dev libavahi-client-dev libblas3gf libblas-dev libboost1.54-all-dev libprotobuf-dev libprotobuf-c0 libprotobuf-c0-dev libprotobuf-lite7 libprotoc7 libprotobuf7 libtbb-dev libtbb2 libuuid1 mercurial openssh-server openssh-client libeigen3-dev cppcheck glew-utils libglew-dev libzmq-dev libzmq1"

sudo apt-add-repository -y ppa:git-core/ppa
sudo apt-add-repository -y ppa:ubuntu-toolchain-r/test
sudo apt-add-repository -y ppa:boost-latest/ppa
sudo apt-add-repository -y ppa:chris-lea/protobuf
sudo apt-get update -y
sudo apt-get dist-upgrade -y
sudo apt-get install -y -f $PACKAGES
sudo apt-get install --no-install-recommends ubuntu-desktop

# Generate ssh key
mkdir ~/.ssh
cd ~/.ssh
ssh-keygen -t rsa -N "" -f id_rsa

cd $SETUP_DIR

# Copy ssh key onto robotics server
ssh-copy-id rpg@robotics.gwu.edu

# Install custom built rpg dependencies
sudo chmod -R 777 /usr/local;

# Make GCC 4.7 the default
sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc-4.7 50
sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-4.7 50

# Update CMake
wget http://www.cmake.org/files/v2.8/cmake-2.8.12.tar.gz
tar -xzf cmake-2.8.12.tar.gz
mkdir cmake-2.8.12/build
cd cmake-2.8.12/build
cmake ..
make
make install

# zmq.hpp
cd /usr/local/include
wget https://raw.github.com/zeromq/cppzmq/master/zmq.hpp
cd $SETUP_DIR

# OpenCV
if [ ! -d opencv ]; then
    git clone https://github.com/Itseez/opencv.git
else
    cd opencv
    git pull origin master
    cd ..
fi
cd opencv
git checkout 2.4.6
mkdir opencv/build
cd opencv/build
cmake .. -DENABLE_PRECOMPILED_HEADERS=OFF
make
make install

# Our code
cd
if [ ! -d rslam ]; then
    git clone --recursive https://github.com/gwu-robotics/rslam.git
else
    cd rslam
    git pull origin master
    git submodule update --init --recursive;
    cd ..
fi

mkdir rslam/build
cd rslam/build
cmake ../rslam
make
