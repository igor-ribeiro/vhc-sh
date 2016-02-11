#!/bin/sh

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

FILE="<VirtualHost *:80>
\n\tServerName $1
\n\tDocumentRoot $2
\n\t<Directory $2>
\n\t\tOptions Indexes FollowSymLinks
\n\t\tAllowOverride All
\n\t\tRequire all granted
\n\t</Directory>
\n</VirtualHost>"

echo $FILE > /etc/apache2/sites-available/$1.conf

echo "127.0.0.1 $1" >> /etc/hosts

a2ensite -q $1.conf
service apache2 reload

echo "Virtual host '$1' created"
