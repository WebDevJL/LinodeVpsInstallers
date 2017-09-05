#!/bin/bash
cd ~/vps-manager

##
## Server commons installs
##

# Install the basics
bash server-commons/basics.parts.sh
# Install MySQL
bash server-commons/mysql.setup.sh
# Install and configure the web server
bash server-commons/web.parts.sh
# Install of Composer, Node, NPM, bower
bash server-commons/extra.utils.sh

# Return to home dir of root user
cd ~
##
## Web sites setup
##

# puzzlout.ovh
#bash sites-available/step110.puzzlout.ovh.sh
