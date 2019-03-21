user=$1
keyPvtFile=$2

echo "Adding User $user keyPvtFile $keyPvtFile"
echo EXECUTING COMMAND mkdir ~$USER/.ssh
mkdir ~$USER/.ssh
echo EXECUTING COMMAND mkdir
cp ./keyLocker/$value ~$USER/.ssh/authorized_keys
echo EXECUTING COMMAND mkdir
chown -R $USER ~$USER/.ssh; chmod 700 ~$USER/.ssh
echo EXECUTING COMMAND mkdir
chmod 600 ~$USER/.ssh/authorized_keys
