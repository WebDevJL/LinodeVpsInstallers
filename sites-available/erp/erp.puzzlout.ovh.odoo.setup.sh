#!/bin/bash

# Guide: https://www.linode.com/docs/websites/cms/install-odoo-10-on-ubuntu-16-04
sudo apt update && sudo apt upgrade
sudo ufw allow 8069/tcp
sudo apt install git python-pip postgresql postgresql-server-dev-9.5 python-all-dev python-dev python-setuptools libxml2-dev libxslt1-dev libevent-dev libsasl2-dev libldap2-dev pkg-config libtiff5-dev libjpeg8-dev libjpeg-dev zlib1g-dev libfreetype6-dev liblcms2-dev liblcms2-utils libwebp-dev tcl8.6-dev tk8.6-dev python-tk libyaml-dev fontconfig
sudo su - postgres
createuser odoo -U postgres -dRSP
exit
sudo adduser --system --home=/opt/odoo --group odoo
sudo mkdir /var/log/odoo
echo "Download Odoo..."
sudo git clone https://www.github.com/odoo/odoo --depth 1 --branch 10.0 --single-branch /opt/odoo
echo "Begin install of Odoo..."
su -
sudo pip install -r /opt/odoo/doc/requirements.txt
sudo pip install -r /opt/odoo/requirements.txt
sudo curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt install -y nodejs
sudo npm install -g less less-plugin-clean-css
sudo apt install ucommon-utils

# Install Stable Wkhtmltopdf Version
cd /tmp
sudo wget https://downloads.wkhtmltopdf.org/0.12/0.12.1/wkhtmltox-0.12.1_linux-trusty-amd64.deb
sudo dpkg -i wkhtmltox-0.12.1_linux-trusty-amd64.deb
sudo cp /usr/local/bin/wkhtmltoimage /usr/bin
