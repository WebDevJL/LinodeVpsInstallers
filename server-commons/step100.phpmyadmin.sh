#!/bin/bash
#Install of  phpMyAdmin
echo "Install of  phpMyAdmin"
sudo apt-get install mcrypt
sudo service apache2 restart
sudo apt-get install phpmyadmin
sudo vim /etc/phpmyadmin/config.inc.php
# line 100:
# Add $cfg['ForceSSL'] = 'true'; to /etc/phpmyadmin/config.inc.php file
cp /etc/phpmyadmin/config.inc.php /etc/phpmyadmin/config.inc.php.bak
cp /etc/phpmyadmin/config.inc.php /vps-manager/assets/conf/phpmyadmin/config.inc.php
echo "Done installing phpMyAdmin."