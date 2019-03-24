user=$1
keyPvtFile=$2

HOME_DIR=$(eval echo ~$USER)

echo "Adding User $user keyPvtFile $keyPvtFile"
echo EXECUTING COMMAND mkdir $HOME_DIR/.ssh
mkdir $HOME_DIR/.ssh
echo EXECUTING COMMAND cp ./keyLocker/$value $HOME_DIR/.ssh/authorized_keys
cp ./keyLocker/$keyPvtFile $HOME_DIR/.ssh/authorized_keys
echo EXECUTING COMMAND chown -R $USER:$USER $HOME_DIR/.ssh; chmod 700 ~$HOME_DIR/.ssh
chown -R $USER:$USER $HOME_DIR/.ssh; chmod 700 $HOME_DIR/.ssh
echo EXECUTING COMMAND chmod 600 $HOME_DIR/.ssh/authorized_keys
chmod 600 ~$HOME_DIR/.ssh/authorized_keys
