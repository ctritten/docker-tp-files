#!/bin/bash

if [ -f /run/secrets/mysql-password ] ; then
    tail -n 1 /run/secrets/mysql-password
    export MYSQL_PASSWORD="$(tail -n 1 /run/secrets/mysql-password)"
fi

rm -f /run/apache2/apache2.pid
echo "PassEnv MYSQL_USER MYSQL_PASSWORD MYSQL_DATABASE MYSQL_HOST" > /etc/apache2/conf-available/env.conf
a2enconf env
exec /usr/sbin/apache2ctl -D FOREGROUND
