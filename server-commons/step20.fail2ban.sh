echo "Install of fail2ban"
apt-get update && apt-get upgrade -y
apt-get install fail2ban
apt-get install sendmail
ufw allow ssh
ufw enable
cp /etc/fail2ban/fail2ban.conf /etc/fail2ban/fail2ban.local
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
vim /etc/fail2ban/jail.local
fail2ban-client status
sudo netstat -tulpn
echo "Done with fail2ban"
