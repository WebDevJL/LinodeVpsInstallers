#!/bin/bash
# Source: https://www.ostechnix.com/install-vsftpd-server-ubuntu-16-04-lts/
sudo apt-get install vsftpd
sudo cp /etc/vsftpd.conf /vps-manager/assets/conf/vsftp/
sudo vim /etc/vsftpd.conf
sudo systemctl restart vsftpd
sudo systemctl status vsftpd
read -n1 -rsp $'Check if the vsftp service is running, pPress any key to continue or Ctrl+C to exit...\n'

echo "Add a user for wordpress access via FTP..."
sudo adduser wp_user

echo "Let's check FTP server is up..."
sudo telnet localhost 21
read -n1 -rsp $'Type "quit to exit if you connected fine...\n'

