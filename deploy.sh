#!/bin/bash
cd ~/vps-manager

##
## Server commons installs
##

# Install the basics
bash server-commons/basics.sh
# Install and configure the web server
bash server-commons/web.parts.sh
# Install of Composer
bash server-commons/composer.setup.sh
# Install of  Node, NPM, bower
bash server-commons/extra.utils.sh

# Return to home dir of root user
cd ~
##
## Web sites setup
##

# puzzlout.ovh
#bash sites-available/step110.puzzlout.ovh.sh
