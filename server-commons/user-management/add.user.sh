#!/bin/bash
# $1 => The user name
# $2 => The user group
echo "Setting up the basics... Adding new user $1..."
adduser $1
adduser $1 sudo
echo "Creating web directory /home/$1/www..."
mkdir /home/$1/www
echo "... that $1:$2 owns!"
chown -R $1:$2 /home/$1/www
echo "$1:$2 owns web directory /home/$1/www!"
echo "Setting up the basics... User $1 created!"
read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n'
