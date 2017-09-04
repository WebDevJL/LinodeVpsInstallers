#!/bin/bash
cd ~/vps-manager

echo "Install of Composer"
cd ~
sudo apt-get install zip unzip php7.0-zip
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
composer

cd ~
