#!/bin/bash
# $1 => example : "blog.puzzlout.ovh
#Install of Portal on puzzlout.ovh"
echo "Install of Blog on $1"
mkdir -p /home/puzzlout/www/$1/{public_html,logs}
cd /home/puzzlout/www/$1/public_html
#git clone https://github.com/puzzlout/wordpress
wget https://wordpress.org/latest.tar.gz
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
