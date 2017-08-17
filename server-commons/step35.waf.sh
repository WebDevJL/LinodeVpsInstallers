# Web Application Firewall (WAF) installation
echo "Beginning Web Application Firewall (WAF) installation..."
sudo apt-update
sudo apt-get install libapache2-modsecurity
apache2ctl -M | grep -i security
read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n'
sudo rm -rf /usr/share/modsecurity-crs
sudo apt-get install -y git
sudo git clone https://github.com/SpiderLabs/owasp-modsecurity-crs.git /usr/share/modsecurity-crs
sudo cp /usr/share/modsecurity-crs/modsecurity_crs_10_setup.conf.example /usr/share/modsecurity-crs/modsecurity_crs_10_setup.conf
cd /usr/share/modsecurity-crs

echo "Done with Web Application Firewall (WAF) installation!"
