#!/bin/bash

cat << EOF > /etc/apache2/sites-available/nextcloud.conf
<VirtualHost *:80>

  DocumentRoot /var/www/nextcloud

  <Directory /var/www/nextcloud/>
    Require all granted
    Options FollowSymlinks MultiViews
    AllowOverride All

    <IfModule mod_dav.c>
      Dav off
    </IfModule>

    SetEnv HOME /var/www/nextcloud
    SetEnv HTTP_HOME /var/www/nextcloud

  </Directory>

  ErrorLog  /var/log/apache2/nextcloud_error.log
  CustomLog /var/log/apache2/nextcloud_access.log combined

</VirtualHost>
EOF