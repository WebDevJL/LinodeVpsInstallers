
sudo cp /opt/odoo/debian/odoo.conf /etc/odoo-server.conf
sudo vim /lib/systemd/system/odoo-server.service
sudo chmod 755 /lib/systemd/system/odoo-server.service
sudo chown root: /lib/systemd/system/odoo-server.service
sudo chown -R odoo: /opt/odoo/
sudo chown odoo:root /var/log/odoo
sudo chown odoo: /etc/odoo-server.conf
sudo chmod 640 /etc/odoo-server.conf
sudo systemctl start odoo-server
sudo systemctl status odoo-server
sudo journalctl -u postgresql
sudo systemctl status odoo-server
sudo systemctl enable odoo-server
# Reboot Linode VPS
sudo journalctl -u odoo-server
# Browser Odoo on : 172.104.145.67:8069
