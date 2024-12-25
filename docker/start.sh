#!/bin/bash


service postgresql start
psql -U postgres -c "ALTER USER postgres PASSWORD 'postgres';"
nginx -g "daemon off"

sudo service php8.2-fpm start
ln -s /etc/nginx/sites-available/back.conf /etc/nginx/sites-enabled/
ln -s /etc/nginx/sites-available/front.conf /etc/nginx/sites-enabled/


if [[ "$GITREPOSBACK" != "" ]]; then sudo rm -rf /var/www/back/repos && mkdir /var/www/back/repos && sudo chmod -R 777 /var/www/back/repos && sudo git clone  $GITREPOSBACK /var/www/back/repos ; fi
if [[ "$GITREPOSFRONT" != "" ]]; then sudo rm -rf /var/www/front/repos && mkdir /var/www/front/repos && sudo chmod -R 777 /var/www/front/repos && sudo git clone  $GITREPOSFRONT /var/www/front/repos ; fi

sudo service nginx start

sudo tail -f /dev/null
