#!/bin/bash
# $1 => the domain. example : blog.puzzlout.ovh
# $2 => the user. example : "puzzlout

echo "Install of Blog on $1"
echo "Creatign basics directories for $1"
mkdir -p /home/$2/www/$1/{public_html,logs,src}
ls -l /home/$2/www/$1
read -n1 -rsp $'Check /home/$2/www/$1 has 3 folders (public_html, logs and src), Press any key if you see these or Ctrl+C to fix the configuration...\n'
echo "... them browse to that src directory!"
cd /home/$2/www/$1/src
#git clone https://github.com/puzzlout/wordpress
echo "Download the latest wordpress..."
wget http://wordpress.org/latest.tar.gz
echo "... and unzip it!"
tar -xvf latest.tar.gz
echo "Create a backup of the original wordpress package..."
mv latest.tar.gz wordpress-`date "+%Y-%m-%d"`.tar.gz
echo "Move the wordpress files to public_html..."
mv wordpress/* ../public_html/
echo "... and remove the src/wordpress folder..."
rm -R wordpress
echo "Browse to public_html folder..."
cd ../public_html

sudo cp /home/$2/vps-manager/assets/sites-available/$1.conf /etc/apache2/sites-available/$1.conf
sudo vim /etc/apache2/sites-available/$1.conf
sudo apachectl configtest
# Generate the certs Let's Encrypt for the domain
echo "Generate the certs Let's Encrypt for $1"
sudo bash /home/$2/vps-manager/sites-available/common/website-ssl-setup.sh $1
sudo a2ensite $1.conf
sudo systemctl reload apache2
read -n1 -rsp $'Browse to $1, Press any key if you see the wordpress install screen or Ctrl+C to fix the configuration...\n'
echo "Force temporaly the permissions to enable the wp-config.php file creation."
chmod -R 777 ../public_html
read -n1 -rsp $'Resume and finish the install on $1 until you are ready to login as the admin, Press any key if you see the wordpress login page or Ctrl+C to fix the configuration...\n'
echo "... and modify the permissions on wp-config.php file to 777"
chmod 777 wp-config.php
echo "Revert permissions to 755..."
sudo chmod -R 755 ../public_html
echo "... except for wp-config.php that remains 777"
sudo chmod -R 777 ../public_html/wp-config.php
echo "Change owner on wordpress install to www-data (the webserver user)..."
sudo chown -R www-data:www-data ../public_html/
read -n1 -rsp $'Login to $1, Press any key if you see the dashboard or Ctrl+C to fix the configuration...\n'
# /** Bypass FTP */
# define('FS_METHOD', 'direct');
read -n1 -rsp $'Add a define with Key=FS_METHOD and value=direct to wp-config.php and update any plugin that needs it, Press any key if you successfully updated the plugins or Ctrl+C to fix the configuration...\n'
sudo vim wp-config.php
read -n1 -rsp $'Press any key if you successfully updated all the plugins or Ctrl+C to fix the configuration...\n'
echo "Verify rewrite module is enabled..."
sudo a2enmod rewrite
read -n1 -rsp $'Press any key if you see Module rewrite already enabled or Ctrl+C to install it...\n'
echo "Wordpress install and initial setup is complete! Proceed to optimisations :)"

cd ~