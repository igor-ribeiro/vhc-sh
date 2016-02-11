## VHC - Virtual Host Create
Creates a virtual host for apache by adding a .conf file to your sites-available and editing toy /etc/hosts.

## Instalation
Save the ``` vhc.sh ``` file to ``` /usr/bin ```

## Usage
``` sudo vhc.sh SERVER_NAME PATH ```

E.g
``` sudo vhc.sh foo.dev /var/www/html/foo/public ```

Be happy :D

## To Do
Create a general command like ``` vh ``` and add option for creating and deleting hosts.

E.g
```
sudo vh.sh -c foo.dev /var/www/html/foo/public
sudo vh.sh -d foo.dev
```
