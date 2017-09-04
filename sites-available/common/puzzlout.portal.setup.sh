#!/bin/bash
#$1 => the domain to install
echo "Install of Portal on $1"
mkdir -p /var/www/$1/{public_html,logs}
cd /var/www/$1/public_html
git clone https://github.com/puzzlout/portal
cp /vps-manager/assets/html/index.php /var/www/$1/public_html/
sudo cp /vps-manager/assets/sites-available/$1.conf /etc/apache2/sites-available/$1.conf
sudo vim /etc/apache2/sites-available/$1.conf
#Generate the certs Let's Encrypt for puzzlout.ovh`
echo "Generate the certs Let's Encrypt for $1"
cd /opt/letsencrypt
sudo -H ./letsencrypt-auto --apache -d $1 -d www.$1
sudo ls /etc/letsencrypt/live #To list the certs of Let's encrypt
sudo -H ./letsencrypt-auto --apache --renew-by-default -d $1 -d www.$1
#echo "@monthly root /opt/letsencrypt/letsencrypt-auto --quiet --apache --renew-by-default -d $1 -d www.$1 >> /var/log/letsencrypt/letsencrypt-auto-update.log" | sudo tee --append /etc/crontab
sudo a2ensite $1.conf
sudo systemctl reload apache2
cd ~
cd ..

#Install of  phpMyAdmin for puzzlout.ovh
echo "Install of  phpMyAdmin for $1"
mkdir -p /var/www/sql.$1/{public_html,logs}
cd /var/www/sql.$1/public_html
cp /vps-manager/assets/conf/phpmyadmin/.htaccess /var/www/sql.$1/public_html/phpmyadmin/.htaccess
cd /var/www/sql.$1/public_html
sudo ln -s /usr/share/phpmyadmin
cd ~
cd ..
#Install of Portal on sql.puzzlout.ovh"
echo "Install of Portal on sql.$1"
sudo cp /vps-manager/assets/sites-available/sql.$1.conf /etc/apache2/sites-available/sql.$1.conf
sudo vim /etc/apache2/sites-available/sql.$1.conf
sudo bash /vps-manager/sites-available/common/website-ssl-setup.sh $1
sudo a2ensite sql.$1.conf
sudo systemctl reload apache2
cd ~
cd ..
