#!/bin/sh

sed -i "s/FASTCGI_PASS/${FASTCGI_PASS}/" /etc/nginx/conf.d/default.conf

exec "$@"
