#!/bin/bash
echo "Setting up the basics..."
vHostname="puzzlout-www-main1.linode"
vIpV4="172.104.131.57"
vIpV6="2a01:7e01::f03c:91ff:fed4:fb47"
vDomain="puzzlout.ovh"
vUser="puzzlout"
vUserGroup="puzzlout"
vHomeIp="80.9.25.55"
vWorkIp="81.252.62.189"

apt-get update && apt-get upgrade
cp /etc/hostname /etc/hostname.bak
echo "$vHostname" > /etc/hostname
hostnamectl set-hostname $vHostname
cp /etc/hosts /etc/hosts.bak
echo "$vIpV4 $vHostname" >> /etc/hosts
echo "$vIpV6 $vHostname" >> /etc/hosts
vim /etc/hosts
dpkg-reconfigure tzdata
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
date
adduser $vUser
adduser $vUser sudo
mkdir -p ~/.ssh && sudo chmod -R 700 ~/.ssh/
su -
exit
exit
vim /etc/ssh/sshd_config
cp /etc/ssh/sshd_config /vps-manager/assets/conf/ssh/sshd_config
# Set PermitRootLogin to no 
# Do not set PasswordAuthentication to no yet
echo 'AddressFamily inet' | sudo tee -a /etc/ssh/sshd_config
sudo systemctl restart sshd
su -
exit
