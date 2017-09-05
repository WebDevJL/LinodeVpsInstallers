#!/bin/bash
cd ~/vps-manager

echo "Setting up the basics..."
vHostname="puzzlout-www-main1.linode"
vIpV4="139.162.185.121"
vIpV6="2a01:7e01::f03c:91ff:fecf:8dd8"
vUser="puzzlout"
vUserGroup="puzzlout"
vHomeIp="80.9.25.55"
vWorkIp="81.252.62.189"

bash server-commons/basics/update.upgrade.server.sh
bash server-commons/basics/set.hostname.sh $vHostname
bash server-commons/basics/set.hosts.sh $vIpV4 $vIpV6 $vHostname
bash server-commons/basics/set.timezone.sh
bash server-commons/basics/configure.ssh.sh

bash server-commons/user-management/add.user.sh $vUser $vUserGroup

# Install of fail2ban
bash server-commons/basics/fail2ban.sh
# Check and modify UFW
bash server-commons/basics/ufw.config.sh
# Install of HTTPS with Let's Encrypt
bash server-commons/basics/ssl.setup.sh

cd ~
