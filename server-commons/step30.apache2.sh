#!/bin/bash
vUser="puzzlout"
vUserGroup="puzzlout"

echo "Install of  Apache 2"
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install apache2
chown -R $vUser:$vUserGroup /var/www/
sudo cp /etc/apache2/apache2.conf /etc/apache2/apache2.backup.conf
sudo nano /etc/apache2/apache2.conf
# Set the following :
#KeepAlive Off
sudo cp /etc/apache2/mods-available/mpm_prefork.conf  /etc/apache2/mods-available/mpm_prefork.back.conf
sudo cp vps-manager/assets/mpm_prefork.base.conf /etc/apache2/mods-available/mpm_prefork.conf
#See assets/mpm_prefork.base.conf
sudo a2dismod mpm_event
sudo a2enmod mpm_prefork
sudo systemctl restart apache2
sudo a2dissite 000-default.conf
sudo systemctl reload apache2
