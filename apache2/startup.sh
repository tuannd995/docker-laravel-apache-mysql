#!/bin/bash

mkdir /etc/apache2/ssl 2> /dev/null

a2enmod rewrite
a2enmod headers
service apache2 restart

# Start supervisord in foreground
supervisord