#!/bin/bash
echo "Install of fail2ban"
apt-get update && apt-get upgrade -y
apt-get install fail2ban
apt-get install sendmail
ufw allow ssh
ufw enable
cp /etc/fail2ban/fail2ban.conf /etc/fail2ban/fail2ban.local
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
vim /etc/fail2ban/jail.local
# line 50:
#	Add the home IP address: 80.9.25.55 in the whitelist
# line 129:
# 	Set destemail to puzzlout@gmail.com
# line :
# 	Set sendername to “Admin VPS1 Linode”
# line 132:
# 	Set sender to puzzlout@gmail.com
# line 204:
# 	Set action to "%(action_mwl)s" to send all info when ban happens
# line 219:
# 	Set under [sshd] section next few lines "enabled = true", "maxretry = 6" which will enable this specific jail filter
fail2ban-client status
sudo netstat -tulpn
echo "Done with fail2ban"
