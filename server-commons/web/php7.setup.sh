#!/bin/bash
cd ~/vps_manager

echo "Install of  PHP7"
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt install --no-install-recommends php7.1 libapache2-mod-php7.1 php7.1-mysql php7.1-curl php7.1-json php7.1-gd php7.1-mcrypt php7.1-msgpack php7.1-memcached php7.1-intl php7.1-sqlite3 php7.1-gmp php7.1-geoip php7.1-mbstring php7.1-redis php7.1-xml php7.1-zip
cp /etc/php/7.0/apache2/php.ini /etc/php/7.0/apache2/php.bak.ini
# see assets/php.conf.md
#cp /etc/php/7.0/apache2/php.ini assets/conf/php/php.ini.base
cp assets/conf/php/php.ini /etc/php/7.0/apache2/php.ini
vim /etc/php/7.0/apache2/php.ini
sudo mkdir /var/log/php
sudo chown www-data /var/log/php
echo "Reloading apache2..."
sudo systemctl restart apache2
echo "Apache2 reloaded!"
echo "Done with php7 install."

cd ~
