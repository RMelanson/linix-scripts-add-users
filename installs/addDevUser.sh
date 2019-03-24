if [ "$#" -lt 1 ]
then
    echo "USER Not specified ~ Illegal number of parameters $#"
    return
fi

if [ "$#" -lt 2 ]
then
    echo "SSH_KEY Not specified ~ Illegal number of parameters $#"
    exit
fi

USER=$1
sshDevKey=$2

if grep -q $USER "/etc/passwd"; then
   echo User $USER exists: \*\*\* Not adding \*\*\*
   exit
fi

echo "Adding User $USER"
 
echo PROCESSING USERFILE $USER_FILE

PASSWORD="-p $(openssl passwd -1 "ineedtolearn")"

SHELL="-s /bin/bash"

ADD_NEW_USER="useradd $USER $PASSWORD $SHELL"

echo ########################################################################################

echo PASSWORD = $PASSWORD
echo SHELL = $SHELL
echo HOME_DIR = $HOME_DIR
echo ADD_SSH_SECURITY = $ADD_SSH_SECURITY
echo ADD_SUDO_ACCESS = $ADD_SUDO_ACCESS
echo ADD_NEW_USER = $ADD_NEW_USER

echo ########################################################################################

echo EXECUTING $ADD_NEW_USER
$ADD_NEW_USER

echo EXECUTING "HOME_DIR=$(eval echo ~$USER)"
HOME_DIR=$(eval echo ~$USER)
echo ZZZZZZ HOME_DIR = $HOME_DIR

ADD_SSH_SECURITY=". ./installs/addSSH_Security.sh $USER $sshDevKey"
ADD_SUDO_ACCESS=". ./installs/addSudoAccess.sh"



# SLEEP FOR 1 SECOND GIVE TIME FOR USER TO BE CREATED BEFORE PROCEEDING
sleep 1

echo EXECUTING $ADD_SSH_SECURITY
$ADD_SSH_SECURITY

echo EXECUTING $ADD_SUDO_ACCESS
$ADD_SUDO_ACCESS
