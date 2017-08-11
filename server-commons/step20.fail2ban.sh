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
# Add the home IP address: 80.9.25.55 in the whitelist
# Set destemail to puzzlout@gmail.com
# Set sendername to “Admin VPS1 Linode”
# Set sender to puzzlout@gmail.com
# Set action to "%(action_mwl)s" to send all info when ban happens
# Set under [sshd] section next few lines "enabled = true", "maxretry = 6" which will enable this specific jail filter
fail2ban-client status
sudo netstat -tulpn
echo "Done with fail2ban"
