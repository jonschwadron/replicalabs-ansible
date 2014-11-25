#                 _ _           _       _
#  _ __ ___ _ __ | (_) ___ __ _| | __ _| |__  ___
# | '__/ _ \ '_ \| | |/ __/ _` | |/ _` | '_ \/ __|
# | | |  __/ |_) | | | (_| (_| | | (_| | |_) \__ \
# |_|  \___| .__/|_|_|\___\__,_|_|\__,_|_.__/|___/
#          |_|
#
# Copyright 2014, Replica Labs
# All rights reserved - Do Not Redistribute

ANDROID_DIRECTORY = File.join(Dir.home, "android")
SRC_FILE = "adt-bundle-linux-x86_64-20140321.zip"
SRC_LINK = "http://dl.google.com/android/adt/22.6.2/adt-bundle-linux-x86_64-20140321.zip"
EXTRACT_PATH = "#{ANDROID_DIRECTORY}/#{SRC_FILE}"
SRC_DIRECTORY = "#{ANDROID_DIRECTORY}/adt-bundle-linux-x86_64-20140321"

directory "#{ANDROID_DIRECTORY}" do
  action :create
end

remote_file "#{ANDROID_DIRECTORY}/#{SRC_FILE}" do
  source "#{SRC_LINK}"
  not_if { ::File.exists?(EXTRACT_PATH) }
end

ruby_block "unzip" do
  block do
    require 'rubygems'
    require 'zip'
    def unzip_file (file, destination)
      Zip::File.open(file) do |zip_file|
      zip_file.each do |f|
        f_path = File.join(destination, f.name)
        FileUtils.mkdir_p(File.dirname(f_path))
        f.extract(f_path)
        end
      end
    end
    unzip_file("#{EXTRACT_PATH}", "#{ANDROID_DIRECTORY}")
    not_if { ::File.exists?(SRC_DIRECTORY) }
end
