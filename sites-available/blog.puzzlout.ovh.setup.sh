#!/bin/bash
vDomain="blog.puzzlout.ovh"

#Install of Portal on puzzlout.ovh"
echo "Install of Portal on $vDomain"
mkdir -p /var/www/$vDomain/{public_html,logs}
cd /var/www/$vDomain/public_html
git clone https://github.com/puzzlout/wordpress
cp /vps-manager/assets/html/index.php /var/www/$vDomain/public_html/
sudo cp /vps-manager/assets/sites-available/$vDomain.conf /etc/apache2/sites-available/$vDomain.conf
sudo vim /etc/apache2/sites-available/$vDomain.conf
#Generate the certs Let's Encrypt for blog.puzzlout.ovh`
sudo bash /vps-manager/sites-available/common/website-ssl-setup.sh $vDomain
sudo a2ensite $vDomain.conf
sudo systemctl reload apache2
cd ~
cd ..
