#!/bin/bash
# $1 => the domain name

echo "Generate the SSL certs with Let's Encrypt for $1"
cd /opt/letsencrypt
sudo -H ./letsencrypt-auto --apache -d $1
sudo ls /etc/letsencrypt/live #To list the certs of Let's encrypt
echo "Setup the cron tasks to auto renew the SSL cert for $1 and www.$1..."
echo "@monthly root /opt/letsencrypt/letsencrypt-auto --quiet --apache --renew-by-default -d $1 -d www.$1 >> /var/log/letsencrypt/letsencrypt-auto-update.log" | sudo tee --append /etc/crontab
# Bug: https://community.letsencrypt.org/t/apache-sslcertificatefile-error-does-not-exist-or-is-empty/14995/13
echo "Fix the permissions of the directories where the certs are stored..."
sudo chmod -R 755 /etc/letsencrypt/live
sudo chmod -R 755 /etc/letsencrypt/archive
# End bug 
cd ~
