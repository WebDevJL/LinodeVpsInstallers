#Install of  phpMyAdmin
echo "Install of  phpMyAdmin"
sudo apt-get install mcrypt
sudo service apache2 restart
sudo apt-get install phpmyadmin
# Add $cfg['ForceSSL'] = 'true'; to /etc/phpmyadmin/config.inc.php file
sudo vim /etc/phpmyadmin/config.inc.php
