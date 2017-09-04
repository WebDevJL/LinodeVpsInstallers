#!/bin/bash
# $1 => The user name
echo "Setting up the basics... Adding new user $1..."
adduser $vUser
adduser $vUser sudo
echo "Creating web directory..."
mkdir /home/$vUser/www
echo "... that $1 owns!"
chown -R $vUser /home/$vUser/www
echo "Setting up the basics... User $1 created!"
read -n1 -rsp $'If you see "deflate_module (shared)", pPress any key to continue or Ctrl+C to exit...\n'
