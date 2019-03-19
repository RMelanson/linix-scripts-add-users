#!/bin/bash
# ADD USERS ON LINUX

# SETUP WILDFLY CONFIGURATION ENVIRONMENT AND PARAMETERS
. ./env/setEnv.sh

function processUserFile {
   userFile=$1
   ./installs/addUser.sh $userFile
   user=$(echo $userFile | rev | cut -d/ -f1 | rev)
   while read key value
   do
      echo processing User property key = $key with value $value

      case "$key" in
        password)
              ./installs/addPassword.sh $user $value
              ;;
        sshPubKey)
              ./installs/addSSH_PubKey.sh $user $value
              ;;
        sudo)
              ./installs/addSudoAccess.sh $user
              ;;
        shell)
              ./installs/addShellProfile.sh $user $value
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
