#!/bin/bash

set -e
set -u

SRC_DIR=`pwd`
CloneReplicaRepo() {
    cd $SRC_DIR
    repo=$1
    if [[ ! -d $repo ]]; then
	echo "Cloning $repo"
	git clone git@github.com:ReplicaLabs/$repo
    else
	echo "Updating $repo"
	cd $repo
	git pull
	cd ..
    fi
}

CMAKE_REPOS="miniglog GLConsole Sophus Pangolin Calibu HAL SceneGraph Node Kangaroo"

OTHER_REPOS="iDTAM VideoUploader Rendor Server"

for r in $CMAKE_REPOS; do
    CloneReplicaRepo $r

    BUILD_DIR="$SRC_DIR/$r/build"
    mkdir -p $BUILD_DIR
    cd $BUILD_DIR

    cmake .. -DCMAKE_INSTALL_PREFIX=$SRC_DIR/install
    make -j4 install
done

for r in $OTHER_REPOS; do
    CloneReplicaRepo $r
done
