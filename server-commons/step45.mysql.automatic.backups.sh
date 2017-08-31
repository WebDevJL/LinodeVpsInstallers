#!/bin/bash
echo "Let's enbable a cron task to backup automatically the all databases..."
sudo mkdir /var/mysql
sudo mkdir /var/mysql/backups
sudo mkdir /var/mysql/tasks
sudo mkdir /var/mysql/logs
sudo chown -R puzzlout /var/mysql/
sudo cp /vps-manager/assets/crontab/mysql/create.backup.sh /var/mysql/tasks
cd /var/mysql/backups
newDirForBackup=$( date '+%Y-%m-%d' )
sudo mkdir $newDirForBackup
cd $newDirForBackup
cd ~
sudo bash /var/mysql/tasks/create.backup.sh

echo "Set the cron task following the example below..."
echo "0 1 * * * /usr/bin/mysqldump --all-databases > dump-$( date '+%Y-%m-%d_%H-%M-%S' ).sql -u root -pPASSWORD"
cd ~
"MySQL backups enabled!"
read -n1 -rsp $'If you see "deflate_module (shared)", pPress any key to continue or Ctrl+C to exit...\n'
