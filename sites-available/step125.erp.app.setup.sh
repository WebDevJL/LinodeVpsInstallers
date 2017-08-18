#!/bin/bash

#Install of  Dolibarr on erp.puzzlout.ovh
echo "Install of  Dolibarr on $vDomain"
cd /var/www/$vDomain/public_html
composer create-project dolibarr/dolibarr erp
sudo vim /etc/apache2/sites-available/erp.puzzlout.ovh.conf
sudo vim /etc/apache2/sites-available/erp.puzzlout.ovh-le-ssl.conf
sudo systemctl reload apache2
sudo chmod -R 777 /var/www/erp.puzzlout.ovh/public_html/erp/
echo "Follow instruction @ https://erp.puzzlout.ovh"
cd ~
cd ..
