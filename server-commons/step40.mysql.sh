echo "Install of  MySQL"
sudo apt-get install mysql-server
sudo mysql_secure_installation
sudo nano /etc/mysql/mysql.conf.d/mysqld.conf
# See assets/mysql.conf
sudo service mysql restart
mysql -u root -p
