FROM ubuntu

RUN apt-get update
RUN apt-get -y install tzdata
RUN apt-get -y install apache2
RUN echo "I feel the need—the need for speed!" > /var/www/html/index.html
RUN echo "ServerName localhost" | tee /etc/apache2/conf-available/fqdn.conf
RUN a2enconf fqdn

EXPOSE 80
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
