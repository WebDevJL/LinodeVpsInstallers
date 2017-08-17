# Web Application Firewall (WAF) installation
echo "Beginning Web Application Firewall (WAF) installation..."
echo "Let's start with ModSecurity..."
sudo apt-update
# https://www.netnea.com/cms/apache-tutorial-6_embedding-modsecurity/
sudo apt-get install libapache2-modsecurity
apache2ctl -M | grep -i security
read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n'

echo "... and then ModSecurity CRS..."
# http://www.modsecurity.org/crs/
sudo rm -rf /usr/share/modsecurity-crs
sudo apt-get install -y git
sudo git clone https://github.com/SpiderLabs/owasp-modsecurity-crs.git /usr/share/modsecurity-crs
sudo cp /usr/share/modsecurity-crs/modsecurity_crs_10_setup.conf.example /usr/share/modsecurity-crs/modsecurity_crs_10_setup.conf
cd /usr/share/modsecurity-crs

echo "Done with Web Application Firewall (WAF) installation!"
