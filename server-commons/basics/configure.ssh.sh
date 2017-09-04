#!/bin/bash

mkdir -p ~/.ssh && sudo chmod -R 700 ~/.ssh/
cp /vps-manager/assets/conf/ssh/sshd_config /etc/ssh/sshd_config
vim /etc/ssh/sshd_config
#cp /etc/ssh/sshd_config /vps-manager/assets/conf/ssh/sshd_config
echo "Set PermitRootLogin to no"
echo "Do not set PasswordAuthentication yet"
read -n1 -rsp $'If you see "deflate_module (shared)", pPress any key to continue or Ctrl+C to exit...\n'
echo 'AddressFamily inet' | sudo tee -a /etc/ssh/sshd_config
sudo systemctl restart sshd
