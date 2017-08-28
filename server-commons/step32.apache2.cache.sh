#!/bin/bash
echo "Configuring Apache 2 caching..."
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install apache2-utils
sudo a2enmod cache
sudo a2enmod cache_disk
sudo a2enmod expires
echo "Check the following modules are enabled: cache, cache_disk, expires."
apachectl -t -D DUMP_MODULES
sudo systemctl restart apache2
# for each domain, add the configuration found in assets/sites-available/common/content-caching.conf
echo "Now, let's test the cache..."
ls -la /var/cache/apache2/mod_cache_disk/