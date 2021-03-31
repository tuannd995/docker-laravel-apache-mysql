FROM webdevops/apache:ubuntu-18.04

WORKDIR /apps

COPY apache2/vhost.conf /etc/apache2/sites-enabled/vhost.conf

COPY apache2/sites-available/*.conf /etc/apache2/sites-available/*.conf

ADD apache2/startup.sh /opt/startup.sh

ENTRYPOINT ["/opt/docker/bin/entrypoint.sh"]

CMD ["/bin/bash", "/opt/startup.sh"]

EXPOSE 80 8080
