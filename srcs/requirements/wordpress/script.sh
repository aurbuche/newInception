#!/bin/bash

#install Wordpress
mkdir /var/www/
wget https://wordpress.org/latest.tar.gz
tar xvf latest.tar.gz
rm -rf latetest.tar.gz
mv wordpress/ /var/www/

#Install configuration file for PHP
mv	www.conf /etc/php/7.3/fpm/pool.d/

#Configure Wordpress
cd	/var/www/wordpress
sed -i "s/username_here/${WP_USER}/g" wp-config-sample.php
sed -i "s/password_here/${WP_PASSWORD}/g" wp-config-sample.php
sed -i "s/localhost/${HOSTNAME}/g" wp-config-sample.php
sed -i "s/database_name_here/${WP_DATABASE}/g" wp-config-sample.php
mv	wp-config-sample.php wp-config.php

#Launch php
service php7.3-fpm start