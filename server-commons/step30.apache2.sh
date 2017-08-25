#!/bin/bash
vUser="puzzlout"
vUserGroup="puzzlout"

echo "Install of  Apache 2"
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install apache2
chown -R $vUser:$vUserGroup /var/www/

sudo cp /etc/apache2/apache2.conf /etc/apache2/apache2.conf.bak
# sudo vim /etc/apache2/apache2.conf
# Set the following :
#KeepAlive Off
#sudo cp /etc/apache2/apache2.conf /vps-manager/assets/conf/apache2/apache2.conf
sudo cp /vps-manager/assets/conf/apache2/apache2.conf /etc/apache2/apache2.conf
sudo vim /etc/apache2/apache2.conf

sudo cp /etc/apache2/mods-available/mpm_prefork.conf  /etc/apache2/mods-available/mpm_prefork.back.conf
sudo cp /vps-manager/assets/mpm_prefork.base.conf /etc/apache2/mods-available/mpm_prefork.conf
#See assets/mpm_prefork.base.conf

sudo a2dismod mpm_event
sudo a2enmod mpm_prefork
sudo a2enmod headers
sudo a2enmod expires
apachectl -t -D DUMP_MODULES
echo "Desactivate 000-default"
sudo a2dissite 000-default.conf
echo "Reloading apache2..."
sudo systemctl reload apache2
echo "Apache2 reloaded!"
echo "Done with apache2 install."
