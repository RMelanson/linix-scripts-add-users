#!/bin/bash
# ADD USERS ON LINUX

# SETUP WILDFLY CONFIGURATION ENVIRONMENT AND PARAMETERS
. ./env/setEnv.sh

echo current directory = 
pwd

function processUserFile{
   userFile=$1
   cmd=prog
   while read line
   do
      echo line = line
   done < "$userFile"
}

#PROCESS USERS
for userFile in $USERS
do
  echo "Processing $userFile file..."
  # take action on each user file. Add user $user store
  cat $userFile
done
