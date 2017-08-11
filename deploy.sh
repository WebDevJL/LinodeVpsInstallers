#!/bin/bash
##
## Server commons installs
##
cd vps-manager
#Install the basics
bash server-commons/step1.basics.sh
#Install of fail2ban
bash server-commons/step20.fail2ban.sh
#Install of  Apache 2
bash server-commons/step30.apache2.sh
#Install of  MySQL
bash server-commons/step40.mysql.sh
#Install of  PHP7
bash server-commons/step50.php7.sh
#Check and modify UFW
bash server-commons/step60.ufw.sh
#Install of Composer
bash server-commons/step70.composer.sh
#Install of  Node, NPM, bower
bash server-commons/step80.extra.utils.sh
#Install of HTTPS with Let's Encrypt
bash server-commons/step90.ssl.sh
#Install of  phpMyAdmin
bash server-commons/step100.phpmyadmin.sh

##
## Web sites setup
##

# puzzlout.ovh
#bash sites-available/step110.puzzlout.ovh.sh