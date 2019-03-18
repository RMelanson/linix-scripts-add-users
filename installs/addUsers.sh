#!/bin/bash
# ADD USERS ON LINUX

# SETUP WILDFLY CONFIGURATION ENVIRONMENT AND PARAMETERS
. ./env/setEnv.sh

echo current directory = 
pwd

function processUserFile {
   userFile=$1
   echo "Adding User $userFile"
   cmd=prog
   while read line
   do
      echo processing line $line
   done < "$userFile"
}

#PROCESS USERS
for userFile in $USERS
do
  # Add Users defined by UserFile
  processUserFile $userFile
done
