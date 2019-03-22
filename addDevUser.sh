#! /bin/bash
# Setup the required environment

function addUser() {
   echo "Adding Dev User $1"
   . ./installs/addDevUser.sh $1 $sshDevKey
}

if [ $# -eq 0 ]
  then
       echo "No user arguments supplied"
  else
       user=$1
       addUser
fi

. ./env/setEnv.sh