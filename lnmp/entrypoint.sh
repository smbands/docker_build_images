#!/bin/sh
#This script is used to start the php-fpm;
systemctl stop firewalld

sed -i 's/user = apache/user = nginx/' /etc/php-fpm.d/www.conf
sed -i 's/group = apache/group = nginx/' /etc/php-fpm.d/www.conf

/usr/sbin/php-fpm &

exec "$@"
