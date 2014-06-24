#!/bin/bash
set -e
set -u

mkdir -p ~/android
cd ~/android

wget http://dl.google.com/android/adt/22.6.2/adt-bundle-linux-x86_64-20140321.zip
unzip adt-bundle-linux-x86_64-20140321.zip
