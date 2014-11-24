#                 _ _           _       _
#  _ __ ___ _ __ | (_) ___ __ _| | __ _| |__  ___
# | '__/ _ \ '_ \| | |/ __/ _` | |/ _` | '_ \/ __|
# | | |  __/ |_) | | | (_| (_| | | (_| | |_) \__ \
# |_|  \___| .__/|_|_|\___\__,_|_|\__,_|_.__/|___/
#          |_|
#
# Copyright 2014, Replica Labs
# All rights reserved - Do Not Redistribute

<<<<<<< HEAD
ANDROID_DIRECTORY = File.join(Dir.home, "android")
SRC_FILE = "adt-bundle-linux-x86_64-20140321.zip"
SRC_LINK = "http://dl.google.com/android/adt/22.6.2/adt-bundle-linux-x86_64-20140321.zip"
EXTRACT_PATH = "#{ANDROID_DIRECTORY}/#{SRC_FILE}"
SRC_DIRECTORY = "#{ANDROID_DIRECTORY}/adt-bundle-linux-x86_64-20140321"

directory "#{ANDROID_DIRECTORY}" do
  #owner 'root'
  #group 'root'
  #mode 0755
  action :create
end

remote_file "#{ANDROID_DIRECTORY}/#{SRC_FILE}" do
  source "#{SRC_LINK}"
  not_if { ::File.exists?(EXTRACT_PATH) }
=======
android_directory = File.join(Dir.home, "android")
src_file = "adt-bundle-linux-x86_64-20140321.zip"
src_link = "http://dl.google.com/android/adt/22.6.2/adt-bundle-linux-x86_64-20140321.zip"
extract_path = "#{android_directory}/#{src_file}"
src_directory = "#{android_directory}/adt-bundle-linux-x86_64-20140321"

directory "#{android_directory}" do
  action :create
end

remote_file "#{android_directory}/#{src_file}" do
  source "#{src_link}"
  not_if { ::File.exists?(extract_path) }
>>>>>>> c0798e66067003378ba007b6b9a05c3ff371e71d
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
<<<<<<< HEAD
<<<<<<< HEAD
    unzip_file("#{EXTRACT_PATH}", "#{ANDROID_DIRECTORY}")
  end
  not_if { ::File.exists?(SRC_DIRECTORY) }
=======
    unzip_file("#{extract_path}", "#{android_directory}")
  end
  not_if { ::File.exists?(src_directory) }
>>>>>>> c0798e66067003378ba007b6b9a05c3ff371e71d
=======
    unzip_file("#{extract_path}", "#{android_directory}")
  end
  not_if { ::File.exists?(src_directory) }
>>>>>>> c0798e66067003378ba007b6b9a05c3ff371e71d
end
