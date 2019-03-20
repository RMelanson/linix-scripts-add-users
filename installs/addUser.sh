if [ "$#" -lt 1 ]
then
    echo "USER Not specified ~ Illegal number of parameters $#"
    return
fi

USER=$1

if grep -q $USER "/etc/passwd"; then
   echo User $USER exists: \*\*\* Not adding \*\*\*
   return
fi

echo "Adding User $USER"
 
USER_FILE=$USERS/$USER

echo PROCESSING USERFILE $USER_FILE

while read key value
   do
      echo processing User $USER property key = $key with value $value

      case "$key" in
        password)
              PASSWORD="-p $value"
              ;;
        home)
              HOME_DIR="-d /home/$value"
              ;;
        sshPubKey)
              SSH_KEY=$value
              ;;
        sudo)
              ./installs/addSudoAccess.sh $USER
              ;;
        shell)
              SHELL="-s /bin/$value"
              ;;
       *) echo Unknown property key = $key with value $value
             exit 1
             ;;
       esac

done < "$USER_FILE"

echo Adding user=$USER with shell $shell for pkg $pkg

#Check if $pkg admin user exists
if grep -q $USER "/etc/passwd"; then
   echo User $USER exists: \*\*\* Not adding \*\*\*
else
   #Create $pkg admin user $USER and $pkg group $group
   #Check if user directory exists and create it if it does not

   useradd -M -s /bin/bash -g $group -d $home $USER
   chown $USER:$group $home
   #Add $user ssh access
   cp -r ~ec2-user/.ssh $home
fi
