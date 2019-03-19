user=$1
shellPath=$2

shell=$(echo $shellPath | rev | cut -d/ -f1 | rev)

echo "Adding User Shell Profile $shell"

   case "$shell" in
      basch)
#            ./installs/addPassword.sh $value
            ;;
      profile)
#            ./installs/addSSH_PubKey.sh $value
            ;;
      *) echo Unknown shell profile = $key with value $value          exit 1
         ;;
   esac
exit 0
