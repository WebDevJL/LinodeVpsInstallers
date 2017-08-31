#!/bin/bash
echo "Let's remove the SSL setup for $1..."
sudo rm -R /etc/letsencrypt/live/$1
sudo rm -R etc/letsencrypt/archive/$1
echo "SSL setup removed for $1. You regenerate with the command 'bash /vps-manager/sites-available/common/website-ssl-setup.sh example.com'"