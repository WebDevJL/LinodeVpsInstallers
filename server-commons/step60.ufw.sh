echo "Check and modify UFW"
sudo ufw status
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
