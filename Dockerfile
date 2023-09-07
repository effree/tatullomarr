FROM php:7.4-apache
RUN apt-get update && apt upgrade -y
ADD ./app /var/www/html
COPY ./app/tatullomarr.conf /etc/apache2/sites-available/tatullomarr.conf
RUN echo 'SetEnv SITE_URL ${SITE_URL}' >> /etc/apache2/conf-enabled/environment.conf
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf &&\
    a2enmod rewrite &&\
    a2enmod headers &&\
    a2enmod rewrite &&\
    a2dissite 000-default &&\
    a2ensite tatullomarr &&\
    service apache2 restart
EXPOSE 7829
