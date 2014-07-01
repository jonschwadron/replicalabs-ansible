REPLICA LABS SETUP SCRIPTS
====================================

Recommended Configuration
-----------------
Rendor runs on an AWS g2.2xlarge GPU server. The instance that we use runs Ubuntu v14.04, nicknamed Trusty Tahr. We recommend that you work directly with 14.04 on your console in order to best simulate the conditions found on the server. 

Build Order
-------------
These scripts have been provided to facilitate the build of all required libraries on a brand new 14.04 operating system. Run the scripts in the order provided. If they do not run, simply change permissions [sudo chmod +x <script>.sh]. 

- linux_setup.sh: Installs all packages and dependencies for Replica Labs libraries. The OpenCV download might hang; if so, download the .zip directly (copy line 33) and rerun the script.
- clone_repos.sh: Clones all repositories under the Replica Labs GitHub account. The core libraries are built for you. The rest (iDTAM, VideoUpoader, Rendor, and Server) are merely cloned. Build them as needed.
- android.sh: Downloads the Linux ADT bundle in your top directory.
- optimus.sh: Run this script if your configuration uses NVIDIA OPTIMUS. Extra software must be downloaded to bypass some of the preconfigured settings. When a GPU process is run after this script is executed, start the command line with 'primusrun' to utilize this bypass.

These four scripts should do all that's needed to create a working development station.

Software packages
-------------
These were the packages that were cloned, but not built. They are the main software bundles of Replica Labs.

- iDTAM: Should not be needed.
- VideoUploader: The Android prototype application, which will become the Rendor app beta.
- Rendor: The mesh creator, and the core of the Rendor project. Utilizes computer vision algorithms, supported by GPU, to create a 3D mesh of a video.
- Server: All the scripts and processes to communicate to and from the AWS server. 


