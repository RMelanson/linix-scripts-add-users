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
              ./installs/addPassword.sh $userFile $value
              ;;
        sshPubKey)
              ./installs/addSSH_PubKey.sh $userFile $value
              ;;
        sudo)
              ./installs/addSudoAccess.sh $userFile $value
              ;;
        shell)
              ./installs/addShellProfile.sh $userFile $value
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
