#!/bin/bash
##
## Server commons installs
##
cd vps-manager
#Install the basics
bash server-commons/basics.sh
#Install of fail2ban
bash server-commons/fail2ban.sh
#Install of  Apache 2
bash server-commons/apache2.setup.sh
bash server-commons/apache2.cache.sh
bash server-commons/apache2.compression.sh
#Install of  MySQL
bash server-commons/mysql.setup.sh
bash server-commons/mysql.automatic.backups.sh
#Install of  PHP7
bash server-commons/php7.setup.sh
#Install of  phpMyAdmin
bash server-commons/phpmyadmin.setup.sh
#Check and modify UFW
bash server-commons/ufw.config.sh
#Install of Composer
bash server-commons/composer.setup.sh
#Install of  Node, NPM, bower
bash server-commons/extra.utils.sh
#Install of HTTPS with Let's Encrypt
bash server-commons/ssl.setup.sh

##
## Web sites setup
##

# puzzlout.ovh
#bash sites-available/step110.puzzlout.ovh.sh