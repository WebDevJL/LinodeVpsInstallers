<Directory /var/www/sql.puzzlout.com/public_html>
    Require all granted
</Directory>
<VirtualHost *:80>
  # Admin email, Server Name (domain name), and any aliases
  ServerAdmin contact@puzzlout.com
  ServerName  sql.puzzlout.com
  #ServerAlias www.puzzlout.com
 
  # Index file and Document Root (where the public files are located)
  DirectoryIndex index.html index.php
  DocumentRoot /var/www/sql.puzzlout.com/public_html/phpmyadmin
  # Log file locations
  LogLevel warn
  ErrorLog  /var/www/sql.puzzlout.com/logs/error.log
  CustomLog /var/www/sql.puzzlout.com/logs/access.log combined
</VirtualHost>
