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
              SSH_CMD="mkdir ~$USER/.ssh; cp ./keyLocker/$value ~$USER/.ssh/authorized_keys;chown -R $USER ~$USER/.ssh; chmod 700 ~$USER/.ssh; chmod 600 ~$USER/.ssh/authorized_keys"
              ;;
        sudo)
              SUDO_CMD="TO DO CREATE SUDO CCMD"
              ;;
        shell)
              SHELL="-s /bin/$value"
              ;;
       *) echo Unknown property key = $key with value $value
             exit 1
             ;;
       esac

done < "$USER_FILE"

ADD_USER_CMD="useradd $USER $PASSWORD $HOME_DIR $SHELL"

echo EXECUTING $ADD_USER_CMD
#$ADD_USER_CMD
echo EXECUTING $SSH_CMD
#SSH_CMD
echo EXECUTING $SUDO_CMD
#SUDO_CMD
