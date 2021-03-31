FROM webdevops/apache:ubuntu-18.04

WORKDIR /apps

COPY apache2/vhost.conf /etc/apache2/sites-enabled/vhost.conf

COPY apache2/sites-available/*.conf /etc/apache2/sites-available/

ADD apache2/startup.sh /opt/startup.sh

RUN rm -rf /etc/apache2/sites-enabled/10-docker.conf
RUN rm -rf /etc/apache2/sites-available/000-default.conf
RUN rm -rf /etc/apache2/sites-available/default-ssl.conf

ENTRYPOINT ["/opt/docker/bin/entrypoint.sh"]

CMD ["/bin/bash", "/opt/startup.sh"]

EXPOSE 80 8080
