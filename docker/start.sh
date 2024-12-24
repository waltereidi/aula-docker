#!/bin/bash

service postgresql start
psql -U postgres -c "ALTER USER postgres PASSWORD 'postgres';"
nginx -g "daemon off"

sudo service php8.2-fpm start
ln -s /etc/nginx/sites-available/back.conf /etc/nginx/sites-enabled/
ln -s /etc/nginx/sites-available/front.conf /etc/nginx/sites-enabled/

sudo service nginx start

sudo tail -f /dev/null
