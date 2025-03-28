#!/bin/bash

ln -s /etc/nginx/sites-available/back.conf /etc/nginx/sites-enabled/
ln -s /etc/nginx/sites-available/front.conf /etc/nginx/sites-enabled/

sudo service nginx start

sudo tail -f /dev/null
