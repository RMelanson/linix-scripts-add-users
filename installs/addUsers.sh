#!/bin/bash
# ADD USERS ON LINUX

# SETUP WILDFLY CONFIGURATION ENVIRONMENT AND PARAMETERS
. ./env/setEnv.sh

echo current directory = 
pwd

function processUserFile {
   userFile=$1
   echo "Adding User $userFile"
   while read key value
   do
      echo processing User property key = $key with value $value
   done < "$userFile"
}

#PROCESS USERS
for userFile in $USERS
do
  # Add Users defined by UserFile
  processUserFile $userFile
done
