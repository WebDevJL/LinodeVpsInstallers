#!/bin/bash
echo "Perform a MySQL backup..."
#bash /var/mysql/backups/create.backup.sh
cd /var/mysql/backups
newDirForBackup=$( date '+%Y-%m-%d' )
sudo mkdir $newDirForBackup
cd $newDirForBackup
# IMPORTANT : 
#   - no space before "-p"
#   - Put the password in single quotes
mysqldump --all-databases > dump-$( date '+%Y-%m-%d_%H-%M-%S' ).sql -u root -p'SET_PASSWORD'
cd ~
echo "MySQL backup done!"
