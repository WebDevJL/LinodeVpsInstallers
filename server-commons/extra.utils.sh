#!/bin/bash
cd ~/vps-manager


echo "Install of Composer"
cd ~
sudo apt-get install zip unzip php7.0-zip
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
composer

echo "Install of  Node, NPM, Yarn and webpack"
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt install -y nodejs
sudo apt-get install npm
# Bower has become obsolete
# --> Yarn instead!
#sudo npm install -g bower
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
yarn --version
echo "Install webpack..."
yarn add webpack --dev

echo "Update pip (Python package manager)"
pip install --upgrade pip
echo "pip is up-to-date!"

cd ~
