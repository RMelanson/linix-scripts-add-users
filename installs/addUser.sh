   user=$1
   echo "Adding User $user"

if [ "$#" -lt 1 ]
then
    echo "Illegal number of parameters $#"
    return
else
   user=$1
fi

if [ "$#" -lt 2 ]
then
   shell=bash
else
   user=$2
fi

echo Adding user=$user with shell $shell for pkg $pkg

#Check if $pkg admin user exists
if grep -q $user "/etc/passwd"; then
   echo User $user exists: \*\*\* Not adding \*\*\*
else
   #Create $pkg admin user $user and $pkg group $group
   #Check if user directory exists and create it if it does not
   if [ ! -d $home ]
   then
      echo $home does not exist \*\*\* CREATING \*\*\*
      mkdir -p $home
   fi
   echo Adding $pkg admin user $user to group $group
   if grep -q $group /etc/group
   then
        echo "group exists"
   else
        echo "Creating group $group"
        groupadd $group
   fi

   useradd -M -s /bin/bash -g $group -d $home $user
   chown $user:$group $home
   #Add $user ssh access
   cp -r ~ec2-user/.ssh $home
fi
