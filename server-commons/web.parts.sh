#!/bin/bash
cd ~/vps-manager

# Apache
bash server-commons/web/apache2.setup.sh
# Apache cache module
bash server-commons/web/apache2.cache.sh
# Apache compression module
bash server-commons/web/apache2.compression.sh
# PHP 7.1
bash server-commons/web/php7.setup.sh
# PhpMyAdmin shared setup
bash server-commons/web/phpmyadmin.setup.sh
# Web application firewall, a.k.a WAF
bash server-commons/web/setup.waf.sh

cd ~
