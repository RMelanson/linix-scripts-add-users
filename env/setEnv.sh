# Add Users
pkg=ADD_USERS
gitRepo="linux-scripts-utils-add-users"
installDir="/tmp/scripts/utils/$pkg"
appServicesDir=/etc/init.d
appProcessDir=$appServicesDir/appProcesses
daemon=appServices.d
testApp=" java -jar $appProcessDir/springBootHelloWorldDemo-0.1.0.jar"
