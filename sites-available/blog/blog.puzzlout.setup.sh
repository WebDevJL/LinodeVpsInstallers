#!/bin/bash
# $1 => the domain. example : blog.puzzlout.ovh
# $2 => the user. example : "puzzlout
#Install of Portal on puzzlout.ovh"
echo "Install of Blog on $1"
echo "Creatign basics directories for $1"
mkdir -p /home/$2/www/$1/{public_html,logs}
echo "Browse to /home/$2/www/$1/public_html"
cd /home/$2/www/$1/public_html
echo "Create the directory where the wordpress install is stored..."
mkdir src
echo "... them browse to that src directory!"
cd src
#git clone https://github.com/puzzlout/wordpress
echo "Download the latest wordpress..."
wget https://wordpress.org/latest.tar.gz
echo "... and unzip it!"
tar -xzvf latest.tar.gz 
rm latest.tar.gz
sudo chmod -R 777 wordpress
sudo cp /vps-manager/assets/sites-available/$1.conf /etc/apache2/sites-available/$1.conf
sudo vim /etc/apache2/sites-available/$1.conf
# Generate the certs Let's Encrypt for the domain
echo "Generate the certs Let's Encrypt for $1"
sudo bash /vps-manager/sites-available/common/website-ssl-setup.sh $1
sudo a2ensite $1.conf
sudo systemctl reload apache2
cd ~
cd ..
