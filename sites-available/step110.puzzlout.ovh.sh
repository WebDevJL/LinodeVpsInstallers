vDomain = "puzzlout.ovh"

#Install of Portal on puzzlout.ovh"
echo "Install of Portal on $vDomain"
mkdir -p /var/www/$vDomain/{public_html,logs}
cd /var/www/$vDomain/public_html
git clone https://github.com/puzzlout/portal
cp /vps-manager/html/index.php /var/www/$vDomain/public_html/
sudo cp /vps-manager/assets/sites-available/$vDomain.conf /etc/apache2/sites-available/$vDomain.conf
sudo vim /etc/apache2/sites-available/$vDomain.conf

#Generate the certs Let's Encrypt for puzzlout.ovh`
echo "Generate the certs Let's Encrypt for $vDomain"
cd /opt/letsencrypt
sudo -H ./letsencrypt-auto --apache -d $vDomain -d www.$vDomain
sudo ls /etc/letsencrypt/live #To list the certs of Let's encrypt
sudo -H ./letsencrypt-auto --apache --renew-by-default -d $vDomain -d www.$vDomain
echo "@monthly root /opt/letsencrypt/letsencrypt-auto --quiet --apache --renew-by-default -d $vDomain -d www.$vDomain >> /var/log/letsencrypt/letsencrypt-auto-update.log" | sudo tee --append /etc/crontab

#Install of  phpMyAdmin for puzzlout.ovh
echo "Install of  phpMyAdmin for $vDomain"
mkdir -p /var/www/sql.$vDomain/{public_html,logs}
cd /var/www/sql.$vDomain/public_html
cp /vps-manager/conf/.htaccess.phpmyadmin /var/www/sql.$vDomain/public_html/phpmyadmin/.htaccess
sudo ln -s /usr/share/phpmyadmin
sudo cp /vps-manager/assets/sites-available/sql.$vDomain.conf /etc/apache2/sites-available/sql.$vDomain.conf
sudo vim /etc/apache2/sites-available/sql.$vDomain.conf
cd /opt/letsencrypt
sudo -H ./letsencrypt-auto --apache -d sql.$vDomain
sudo -H ./letsencrypt-auto --apache --renew-by-default -d sql.$vDomain
echo "@monthly root /opt/letsencrypt/letsencrypt-auto --quiet --apache --renew-by-default -d sql.$vDomain >> /var/log/letsencrypt/letsencrypt-auto-update.log" | sudo tee --append /etc/crontab
sudo a2ensite sql.$vDomain.conf
sudo systemctl reload apache2