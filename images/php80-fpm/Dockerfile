FROM php:8.0.2-fpm


COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions @composer \
    && install-php-extensions opcache intl zip bz2 mcrypt yaml imagick mongodb pgsql pdo_mysql pdo_pgsql redis amqp
    #&& install-php-extensions xdebug

ARG USER_ID
ARG GROUP_ID

#ADD ./php.ini /usr/local/etc/php/php.ini

RUN usermod -u ${USER_ID} www-data && groupmod -g ${GROUP_ID} www-data

WORKDIR /var/www

USER "${USER_ID}:${GROUP_ID}"

CMD ["php-fpm"]
