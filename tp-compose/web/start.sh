#!/bin/bash
rm -f /run/apache2/apache2.pid
echo "PassEnv MYSQL_USER MYSQL_PASSWORD MYSQL_DATABASE MYSQL_HOST" > /etc/apache2/conf-available/env.conf
a2enconf env
exec /usr/sbin/apache2ctl -D FOREGROUND
