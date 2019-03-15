#!/bin/bash
# ADD USERS ON LINUX

# SETUP WILDFLY CONFIGURATION ENVIRONMENT AND PARAMETERS
. ./env/setEnv.sh

#PROCESS USERS
for user in $USERS
do
  echo "Processing $user file..."
  # take action on each user file. Add user $user store
  cat $user
done
