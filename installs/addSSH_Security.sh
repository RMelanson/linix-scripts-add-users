user=$1
keyPvtFile=$2

echo "Adding User $user keyPvtFile $keyPvtFile"
echo EXECUTING COMMAND mkdir ~$USER/.ssh
mkdir ~$USER/.ssh
echo EXECUTING COMMAND cp ./keyLocker/$value ~$USER/.ssh/authorized_keys
cp ./keyLocker/$keyPvtFile ~$USER/.ssh/authorized_keys
echo EXECUTING COMMAND chown -R $USER ~$USER/.ssh; chmod 700 ~$USER/.ssh
chown -R $USER ~$USER/.ssh; chmod 700 ~$USER/.ssh
echo EXECUTING COMMAND chmod 600 ~$USER/.ssh/authorized_keys
chmod 600 ~$USER/.ssh/authorized_keys
