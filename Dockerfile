FROM alpine/git AS build
RUN git clone --depth 1 https://github.com/kalcaddle/KodExplorer.git /kod
RUN rm -rf /kod/.git
RUN chmod -R 777 /kod

FROM php:7.3-fpm-alpine
# Install GD extension: https://github.com/docker-library/php/issues/225
RUN set -x \
    && apk add --no-cache --update \
            freetype libpng libjpeg-turbo \
            freetype-dev libpng-dev libjpeg-turbo-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j "$(getconf _NPROCESSORS_ONLN)" gd \
    && apk del --no-cache freetype-dev libpng-dev libjpeg-turbo-dev

COPY --from=build /kod .
