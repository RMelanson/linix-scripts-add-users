#!/bin/bash
# ADD USERS ON LINUX

# SETUP WILDFLY CONFIGURATION ENVIRONMENT AND PARAMETERS
. ./env/setEnv.sh

echo current directory = 
pwd

function processUserFile {
   userFile=$1
   ./installs/addUser.sh $userFile
   while read key value
   do
      echo processing User property key = $key with value $value

      case "$key" in
        password)
              ./installs/addPassword.sh $value
              ;;
        sshPubKey)
              ./installs/addSSH_PubKey.sh $value
              ;;
        sudo)
              ./installs/addSudoAccess.sh $value
              ;;
        shell)
              ./installs/addShellProfile.sh $value
              ;;
       *) echo Unknown property key = $key with value $value
             exit 1
             ;;
       esac

   done < "$userFile"
   exit 0
}

#PROCESS USERS
for userFile in $USERS
do
  # Add Users defined by UserFile
  processUserFile $userFile
done
