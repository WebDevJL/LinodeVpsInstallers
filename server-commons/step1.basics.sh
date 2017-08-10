#!/bin/bash
echo "Setting up the basics..."
vHostname="puzzlout-www-main1.linode"
vIpV4="139.162.182.42"
vIpV6="2a01:7e01::f03c:91ff:fed4:ca67"
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
chown -R $vUser:$vUserGroup /var/www/
mkdir -p ~/.ssh && sudo chmod -R 700 ~/.ssh/
su -
vim /etc/ssh/sshd_config
echo 'AddressFamily inet' | sudo tee -a /etc/ssh/sshd_config
sudo systemctl restart sshd
su -
