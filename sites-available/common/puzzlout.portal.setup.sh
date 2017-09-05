#!/bin/bash
#$1 => the domain to install
#$2 => the UNIX user

chmod -R 777 /home/$2/www
rm -R /home/$2/www

echo "Start install of Portal on $1"
echo "Create the directories: \n /home/$2/www/$1/public_html and /home/$2/www/$1/logs..."
mkdir -p /home/$2/www/$1/{public_html,logs}
ls -l /home/$2
ls -l /home/$2/www
read -n1 -rsp $'If all the directories created are displayed, press any key to continue otherwise Ctrl+C to exit...\n'
echo "Browser to /home/$2/www/$1/public_html..."
cd /home/$2/www/public_html
echo "Clone the portal repo..."
git clone https://github.com/puzzlout/portal
echo "Copy the base index.php file in /home/$2/www/$1/public_html/..."
cp /home/$2/vps-manager/assets/html/index.php /home/$2/www/$1/public_html/
echo "Set the apache conf for the portal..."
sudo cp /home/$2/vps-manager/assets/sites-available/$1.conf /etc/apache2/sites-available/$1.conf
echo "... and verify the copy worked..."
sudo vim /etc/apache2/sites-available/$1.conf
read -n1 -rsp $'If the conf file of $1 was not empty, press any key to continue otherwise Ctrl+C to exit...\n'

sudo bash /home/$2/vps-manager/sites-available/common/website-ssl-setup.sh $1
sudo bash /home/$2/vps-manager/sites-available/common/website-ssl-setup.sh www.$1

echo "Enable $1 website..."
sudo a2ensite $1.conf
echo "... and finally reload Apache!"
sudo systemctl reload apache2
read -n1 -rsp $'If Apache reloaded fine, press any key to continue otherwise Ctrl+C to exit...\n'

cd ~

#Install of  phpMyAdmin for puzzlout.ovh
echo "Install of  phpMyAdmin for $1"
mkdir -p /home/$2/www/sql.$1/{public_html,logs}
cd /home/$2/www/sql.$1/public_html
cp /home/$2/vps-manager/assets/conf/phpmyadmin/.htaccess /home/$2/www/sql.$1/public_html/phpmyadmin/.htaccess
cd /home/$2/www/sql.$1/public_html
sudo ln -s /usr/share/phpmyadmin
cd ~

sudo cp /home/$2/vps-manager/assets/sites-available/sql.$1.conf /etc/apache2/sites-available/sql.$1.conf
sudo vim /etc/apache2/sites-available/sql.$1.conf
read -n1 -rsp $'If the conf file of $1 was not empty, press any key to continue otherwise Ctrl+C to exit...\n'

sudo bash /home/$2/vps-manager/sites-available/common/website-ssl-setup.sh $1

echo "Enable sql.$1 website..."
sudo a2ensite sql.$1.conf
echo "... and finally reload Apache!"
sudo systemctl reload apache2
cd ~

