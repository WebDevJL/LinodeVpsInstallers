#!/bin/bash
#Install of HTTPS with Let's Encrypt
echo "Install of HTTPS with Let's Encrypt"
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install git
sudo git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt
echo '@weekly root cd /opt/letsencrypt && git pull >> /var/log/letsencrypt/letsencrypt-auto-update.log' | sudo tee --append /etc/crontab