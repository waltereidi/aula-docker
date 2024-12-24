#!/bin/bash

service postgresql start
psql -U postgres -c "ALTER USER postgres PASSWORD 'postgres';"

sudo service php8.2-fpm start
sudo service nginx start
ln -s /etc/nginx/sites-available/back.conf /etc/nginx/sites-enabled/
ln -s /etc/nginx/sites-available/front.conf /etc/nginx/sites-enabled/
sudo tail -f /dev/null
