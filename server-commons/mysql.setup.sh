#!/bin/bash
cd ~/vps-manager

echo "Install of  MySQL"
sudo apt-get install mysql-server
sudo mysql_secure_installation
#sudo cp /etc/mysql/mysql.conf.d/mysqld.conf /etc/mysql/mysql.conf.d/mysqld.conf.bak
#sudo cp /etc/mysql/mysql.conf.d/mysqld.conf assets/conf/mysql/mysqld.conf
sudo cp assets/conf/mysql/mysqld.conf /etc/mysql/mysql.conf.d/mysqld.conf
vim /etc/mysql/mysql.conf.d/mysqld.conf
sudo service mysql restart
echo "Logging in mysql-server"
echo "(Type exit when you are done)"
mysql -u root -p
echo "Done with mysql install."

cd ~
