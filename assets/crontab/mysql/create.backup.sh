#!/bin/bash
echo "Perform a MySQL backup..."
#bash /var/mysql/backups/create.backup.sh
cd /var/mysql/backups
newDirForBackup=$( date '+%Y-%m-%d' )
sudo mkdir $newDirForBackup
cd $newDirForBackup
mysqldump --all-databases > dump-$( date '+%Y-%m-%d_%H-%M-%S' ).sql -u root -pPASSWORD
cd ~
echo "MySQL backup done!"
