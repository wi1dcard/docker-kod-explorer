#!/bin/sh
set -e

sed -i "s/FASTCGI_PASS/${FASTCGI_PASS}/" /etc/nginx/conf.d/default.conf

exec "$@"
