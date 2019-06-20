#!/bin/bash

# Install dependencies
apt-get update
apt-get install -y apache2 mariadb-server libapache2-mod-php
apt-get install -y php-gd php-json php-mysql php-curl php-mbstring
apt-get install -y php-intl php-imagick php-xml php-zip

# Download and unpack Nextcloud
wget https://download.nextcloud.com/server/releases/latest.tar.bz2
tar -xjf latest.tar.bz2