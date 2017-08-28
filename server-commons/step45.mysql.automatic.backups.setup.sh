#!/bin/bash
echo "Let's enbable a cron task to backup automatically the all databases..."
sudo mkdir /var/mysql
sudo mkdir /var/mysql/backups
sudo chown -R puzzlout /var/mysql/
cd /var/mysql/backups
newDirForBackup=$( date '+%Y-%m-%d' )
sudo mkdir $newDirForBackup
cd $newDirForBackup
mysqldump --all-databases > dump-$( date '+%Y-%m-%d_%H-%M-%S' ).sql -u root -p
echo "Check the test backup was created... a sql file should be listed below..."
ls -l
read -n1 -rsp $'If you see "deflate_module (shared)", pPress any key to continue or Ctrl+C to exit...\n'
echo "Set the cron task following the example below..."
echo "0 1 * * * /usr/bin/mysqldump --all-databases > dump-$( date '+%Y-%m-%d_%H-%M-%S' ).sql -u root -pPASSWORD"
cd ~
"MySQL backups enabled!"
read -n1 -rsp $'If you see "deflate_module (shared)", pPress any key to continue or Ctrl+C to exit...\n'
