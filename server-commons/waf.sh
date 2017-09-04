#!/bin/bash
cd ~/vps-manager

# Web Application Firewall (WAF) installation
echo "Beginning Web Application Firewall (WAF) installation..."
echo "Let's start with ModSecurity..."
sudo apt-get update
# https://www.netnea.com/cms/apache-tutorial-6_embedding-modsecurity/
sudo apt-get install libapache2-mod-security2 -y
sudo apachectl -M | grep --color security2
#sudo mv /etc/modsecurity/modsecurity.conf-recommended /etc/modsecurity/modsecurity.conf
sudo service apache2 reload
echo "Configure ModSecurity..."

sudo cp assets/conf/security2_module/modsecurity.conf /etc/modsecurity/modsecurity.conf
sudo service apache2 reload
read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n'

#echo "... and then ModSecurity CRS..."
# http://www.modsecurity.org/crs/
#sudo rm -rf /usr/share/modsecurity-crs
#sudo apt-get install -y git
#sudo git clone https://github.com/SpiderLabs/owasp-modsecurity-crs.git /usr/share/modsecurity-crs
#sudo cp /usr/share/modsecurity-crs/modsecurity_crs_10_setup.conf.example /usr/share/modsecurity-crs/modsecurity_crs_10_setup.conf
#cd /usr/share/modsecurity-crs

echo "Done with Web Application Firewall (WAF) installation!"

cd ~
