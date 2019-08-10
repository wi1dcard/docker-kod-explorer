FROM wi1dcard/kod-explorer:php

RUN apk add --no-cache nginx

COPY default.conf /etc/nginx/conf.d/

CMD [ "sh", "-c", "nginx -g 'pid /nginx.pid;' && exec php-fpm" ]
