#!/bin/sh

mkdir -p /var/www/html

if [ -f /var/www/html/wp-config.php ]; then
  echo "wordpress already downloaded"
else
  echo "Downloading WordPress..."

  wget http://wordpress.org/latest.tar.gz || {
    echo "Failed to download WordPress"
    exit 1
  }
  tar xfz latest.tar.gz || {
    echo "Failed to extract WordPress"
    exit 1
  }
  mv wordpress/* /var/www/html/ || {
    echo "Failed to move WordPress files"
    exit 1
  }
  rm -rf latest.tar.gz
  rm -rf wordpress

  sed -i "s/username_here/$MYSQL_USER/g" /var/www/html/wp-config-sample.php
  sed -i "s/password_here/$MYSQL_PASSWORD/g" /var/www/html/wp-config-sample.php
  sed -i "s/localhost/$MYSQL_HOSTNAME/g" /var/www/html/wp-config-sample.php
  sed -i "s/database_name_here/$MYSQL_DATABASE/g" /var/www/html/wp-config-sample.php

  cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

  chown -R www-data:www-data /var/www/html
  chmod -R 755 /var/www/html

  echo "WordPress correctly downloaded"
fi
#execute to init server
exec "$@"
