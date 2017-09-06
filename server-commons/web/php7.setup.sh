#!/bin/bash
cd ~/vps_manager

echo "Install of  PHP7"
sudo apt-get install php7.0 php-pear libapache2-mod-php7.0 php7.0-mysql
sudo apt-get install php7.0-curl php7.0-json php7.0-cgi
cp /etc/php/7.0/apache2/php.ini /etc/php/7.0/apache2/php.bak.ini
# see assets/php.conf.md
#cp /etc/php/7.0/apache2/php.ini assets/conf/php/php.ini.base
cp assets/conf/php/php.ini /etc/php/7.0/apache2/php.ini
#sudo vim /etc/php/7.0/apache2/php.ini
sudo mkdir /var/log/php
sudo chown www-data /var/log/php
echo "Reloading apache2..."
sudo systemctl restart apache2
echo "Apache2 reloaded!"
echo "Done with php7 install."

cd ~
