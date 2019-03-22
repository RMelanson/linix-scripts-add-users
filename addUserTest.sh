#! /bin/bash
# Setup the required environment
. ./env/setEnv.sh
sshKey=./KeyLocker/developers
#------------------- INITIAL INSTALL --------------------
. ./installs/addUserTest.sh joe
