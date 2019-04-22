#! /bin/bash
# Setup the required environment
. ./env/setEnv.sh

# COPY RESTORE 
cp $pkg_RESTORE.sh ..

#------------------- INITIAL INSTALL --------------------
./installs/addUsers.sh
