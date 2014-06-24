#!/usr/bin/env bash
set -e
set -u

FFMPEG_PKGS="libavcodec-dev libavutil-dev libavformat-dev libavdevice-dev libavfilter-dev libswscale-dev libpostproc-dev"

CERES_PKGS="libgflags-dev libgoogle-glog-dev libatlas-base-dev libsuitesparse-dev"

PACKAGES="ccache cmake cmake-curses-gui git build-essential subversion bzr default-jdk doxygen freeglut3 freeglut3-dev g++-4.8 gcc-4.8 git-core git-gui git-svn gitk graphviz htop libavcodec-dev libavformat-dev libavutil-dev libavahi-client-dev libavahi-compat-libdnssd-dev libblas3gf libblas-dev libboost1.54-all-dev libprotobuf-dev libprotobuf-c0 libprotobuf-c0-dev libprotobuf-lite8 libprotoc-dev protobuf-compiler libprotobuf8 libtbb-dev libtbb2 libuuid1 mercurial openssh-server openssh-client cppcheck glew-utils libglew-dev libxi-dev libxmu-dev libtool autoconf automake uuid-dev libuuid1 valgrind ant libsuitesparse-dev liblapack-dev libncurses5-dev nvidia-current-dev nvidia-cuda-toolkit nvidia-profiler nvidia-visual-profiler freeglut3 freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libgl1-mesa-glx libglu1-mesa libglu1-mesa-dev gcc g++ gcc-4.6 g++-4.6 linux-headers-generic linux-source libeigen3-dev libzmq3-dev cppcheck gnome-session-flashback gnome-tweak-tool emacs24 libpng12-dev $FFMPEG_PKGS $CERES_PKGS"

sudo apt-get install -y software-properties-common python-software-properties
sudo apt-get update -y
sudo apt-get dist-upgrade -y
sudo apt-get install -y -f $PACKAGES
sudo apt-get install --no-install-recommends -y ubuntu-desktop

# Generate ssh key
mkdir -p ~/.ssh
cd ~/.ssh
if [[ ! -e id_rsa ]]; then
  ssh-keygen -t rsa -N "" -f id_rsa;
fi

# Ubuntu's OpenCV is missing the nonfree libraries.
OPENCV_URL="http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/2.4.9/opencv-2.4.9.zip"
OPENCV_ZIP="opencv-2.4.9.zip"
OPENCV_DIR=opencv-2.4.9

mkdir -p ~/setup
cd ~/setup

if [[ ! -f $OPENCV_ZIP ]]; then
    wget $OPENCV_URL
fi

if [[ ! -d $OPENCV_DIR ]]; then
    unzip $OPENCV_ZIP
fi

# Open up /usr/local for installation
sudo chmod -R uga+rwx /usr/local

mkdir -p $OPENCV_DIR/build
cd $OPENCV_DIR/build
cmake .. -DCMAKE_BUILD_TYPE=Release
make install -j4

cd ~/setup

git clone https://ceres-solver.googlesource.com/ceres-solver
cd ceres-solver
git checkout 1.8.0
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j4 install
