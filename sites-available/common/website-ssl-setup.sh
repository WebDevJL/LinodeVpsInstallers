#!/bin/bash
# $1 => the domain name
echo "Generate the certs Let's Encrypt for $1"
cd /opt/letsencrypt
sudo -H ./letsencrypt-auto --apache -d $1
sudo ls /etc/letsencrypt/live #To list the certs of Let's encrypt
sudo -H ./letsencrypt-auto --apache --renew-by-default -d $1
# Bug: https://community.letsencrypt.org/t/apache-sslcertificatefile-error-does-not-exist-or-is-empty/14995/13
sudo chmod -R 755 /etc/letsencrypt/live
sudo chmod -R 755 /etc/letsencrypt/archive
cd ~
cd ..
# End bug 