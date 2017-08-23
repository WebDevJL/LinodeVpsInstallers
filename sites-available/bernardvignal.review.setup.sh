#!/bin/bash
vDomain="bernardvignal.review"

#Install of ERP on erp.puzzlout.ovh"
echo "Install of ERP on $vDomain"
mkdir -p /var/www/$vDomain/{public_html,logs}
cp /vps-manager/assets/html/index.php /var/www/$vDomain/public_html/
sudo cp /vps-manager/assets/sites-available/$vDomain.conf /etc/apache2/sites-available/$vDomain.conf
sudo vim /etc/apache2/sites-available/$vDomain.conf
#Generate the certs Let's Encrypt for erp.puzzlout.ovh`
echo "Generate the certs Let's Encrypt for $vDomain"
cd /opt/letsencrypt
sudo -H ./letsencrypt-auto --apache -d $vDomain
sudo ls /etc/letsencrypt/live #To list the certs of Let's encrypt
sudo -H ./letsencrypt-auto --apache --renew-by-default -d $vDomain
#echo "@monthly root /opt/letsencrypt/letsencrypt-auto --quiet --apache --renew-by-default -d $vDomain >> /var/log/letsencrypt/letsencrypt-auto-update.log" | sudo tee --append /etc/crontab
# Bug: https://community.letsencrypt.org/t/apache-sslcertificatefile-error-does-not-exist-or-is-empty/14995/13
sudo chmod -R 755 /etc/letsencrypt/live
sudo chmod -R 755 /etc/letsencrypt/archive
sudo a2ensite $vDomain.conf
sudo systemctl reload apache2
cd ~
cd ..
