#!/bin/bash
#$1 => the domain to install
#$2 => the UNIX user

sudo chmod -R 777 /home/$2/www/$1
sudo rm -R /home/$2/www/$1
sudo a2dissite sql.$1
sudo rm /etc/apache2/sites-available/sql.$1.conf
sudo rm /etc/apache2/sites-available/sql.$1-le-ssl.conf
sudo rm /etc/apache2/sites-available/sql.$1.conf
sudo systemctl reload apache2
read -n1 -rsp $'If no error seen while uninstalling sql.$1, press any key to continue otherwise Ctrl+C to exit...\n'

#Install of  phpMyAdmin for puzzlout.ovh
echo "Install of  phpMyAdmin for $1"
mkdir -p /home/$2/www/sql.$1/{public_html,logs}
cd /home/$2/www/sql.$1/public_html
cd /home/$2/www/sql.$1/public_html
sudo ln -s /usr/share/phpmyadmin
sudo cp /home/$2/vps-manager/assets/conf/phpmyadmin/.htaccess /home/$2/www/sql.$1/public_html/phpmyadmin/.htaccess
cd ~

sudo cp /home/$2/vps-manager/assets/sites-available/sql.$1.conf /etc/apache2/sites-available/sql.$1.conf
sudo vim /etc/apache2/sites-available/sql.$1.conf
read -n1 -rsp $'If the conf file of $1 was not empty, press any key to continue otherwise Ctrl+C to exit...\n'

sudo bash /home/$2/vps-manager/sites-available/common/website-ssl-setup.sh sql.$1

echo "Enable sql.$1 website..."
sudo a2ensite sql.$1.conf
echo "... and finally reload Apache!"
sudo systemctl reload apache2
cd ~

