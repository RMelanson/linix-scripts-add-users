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

. ./env/setEnv.sh

echo "Adding User $USER"
 
USER_FILE=./users/$USER

echo PROCESSING USERFILE $USER_FILE

while read key value
   do
      echo processing User $USER property key = $key with value $value

      case "$key" in
        password)
              PASSWORD="-p $(openssl passwd -1 $value)"
              ;;
        home)
              HOME_DIR="-d /home/$value"
              ;;
        sshPubKey)
              ADD_SSH_CMD=". ./installs/addSSH_Security.sh"
              ;;
        sudo)
              ADD_SSH_CMD=". ./installs/addSudoAccess.sh"
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
$ADD_USER_CMD

echo EXECUTING $SSH_CMD
$ADD_SSH_CMD

echo EXECUTING $SUDO_CMD
$ADD_SUDO_CMD
