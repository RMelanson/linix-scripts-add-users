shell=$1
echo "Adding User Shell Profile $shell"

      case "$shell" in
        basch)
              ./installs/addPassword.sh $value
              ;;
        profile)
              ./installs/addSSH_PubKey.sh $value
              ;;
       *) echo Unknown skell profile = $key with value $value
             exit 1
             ;;
       esac
