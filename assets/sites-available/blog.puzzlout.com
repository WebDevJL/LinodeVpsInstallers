<Directory /var/www/blog.puzzlout.com/public_html>
    Require all granted
</Directory>
<VirtualHost *:80>
  # Admin email, Server Name (domain name), and any aliases
  ServerAdmin contact@puzzlout.com
  ServerName  blog.puzzlout.com
 
  # Index file and Document Root (where the public files are located)
  DirectoryIndex index.html index.php
  DocumentRoot /var/www/blog.puzzlout.com/public_html/wordpress
  # Log file locations
  LogLevel warn
  ErrorLog  /var/www/blog.puzzlout.com/logs/error.log
  CustomLog /var/www/blog.puzzlout.com/logs/access.log combined
  CacheQuickHandler off
  CacheLock on
  CacheLockPath /tmp/mod_cache-lock
  CacheLockMaxAge 5
  CacheIgnoreHeaders Set-Cookie

  <Location /> 
    CacheEnable disk
    CacheHeader on
    CacheDefaultExpire 800
    CacheMaxExpire 64000
    CacheIgnoreNoLastMod On
    ExpiresActive on
    ExpiresDefault A300
  </Location>
</VirtualHost>