#!/bin/bash
echo "Install of  Node, NPM, Yarn and webpack"
sudo apt-get install nodejs
sudo apt-get install npm
# Bower has become obsolete
# --> Yarn instead!
#sudo npm install -g bower
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
yarn --version
yarn add webpack --dev

echo "Update pip (Python package manager)"
pip install --upgrade pip
echo "pip is up-to-date!"
