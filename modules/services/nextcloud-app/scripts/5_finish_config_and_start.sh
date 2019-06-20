#!/bin/bash

# Move nextcloud to its final destination and set permissions
chown -R www-data:www-data nextcloud/
mv nextcloud/ /var/www


# Enable Apache modules. Replace default site
a2enmod rewrite
a2enmod headers
a2enmod env
a2enmod dir
a2enmod mime

a2dissite 000-default
a2ensite nextcloud
systemctl reload apache2