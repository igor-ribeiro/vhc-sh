#!/bin/bash

if [ -z "$1" ]
    then
        echo "Missing server name"
        exit 1
fi

if [ -z "$2" ]
    then
        echo "Missing path"
        exit 1
fi

echo "<VirtualHost *:80>" >> /etc/apache2/sites-available/$1.conf
echo "    ServerName $1" >> /etc/apache2/sites-available/$1.conf
echo "    DocumentRoot $2" >> /etc/apache2/sites-available/$1.conf
echo "    <Directory $2>" >> /etc/apache2/sites-available/$1.conf
echo "        Options Indexes FollowSymLinks" >> /etc/apache2/sites-available/$1.conf
echo "        AllowOverride All" >> /etc/apache2/sites-available/$1.conf
echo "        Require all granted" >> /etc/apache2/sites-available/$1.conf
echo "    </Directory>" >> /etc/apache2/sites-available/$1.conf
echo "</VirtualHost>" >> /etc/apache2/sites-available/$1.conf

a2ensite -q $1.conf

echo "127.0.0.1 $1" >> /etc/hosts

service apache2 reload

echo "Virtual host '$1' created"
