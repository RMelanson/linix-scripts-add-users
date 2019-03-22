f [ "$#" -lt 1 ]
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
 
echo PROCESSING USERFILE $USER_FILE

PASSWORD="-p $(openssl passwd -1 "ineedtolearn")"
SHELL="-s /bin/bash"
ADD_SSH_SECURITY=". ./installs/addSSH_Security.sh $USER $sshDevKey"
ADD_SUDO_ACCESS=". ./installs/addSudoAccess.sh"

ADD_NEW_USER="useradd $USER $PASSWORD $HOME_DIR $SHELL"

echo EXECUTING $ADD_NEW_USER
$ADD_NEW_USER

# SLEEP FOR 1 SECOND GIVE TIME FOR USER TO BE CREATED BEFORE PROCEEDING
sleep 1

echo EXECUTING $ADD_SSH_SECURITY
$ADD_SSH_SECURITY

echo EXECUTING $ADD_SUDO_ACCESS
$ADD_SUDO_ACCESS
