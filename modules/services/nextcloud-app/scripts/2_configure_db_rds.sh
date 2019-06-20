#!/bin/bash

# RDS config
cat << EOF > nextcloud/config/autoconfig.php
<?php
\$AUTOCONFIG = array(
  "dbtype"        => "mysql",
  "dbname"        => "${db_name}",
  "dbuser"        => "${db_user}",
  "dbpass"        => "${db_pass}",
  "dbhost"        => "${db_endpoint}",
  "dbtableprefix" => "",
  "adminlogin"    => "${admin_user}",
  "adminpass"     => "${admin_pass}",
  "directory"     => "${data_dir}",
);
EOF