FROM nginx:stable-alpine
WORKDIR /var/www/html

COPY default.conf /etc/nginx/conf.d/
COPY entrypoint.sh /usr/bin/entrypoint.sh

ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]
CMD [ "nginx", "-g", "daemon off;" ]
