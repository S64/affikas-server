FROM matsumotory/ngx-mruby

RUN apt-get update -y
RUN apt-get install -y nano nmap tree
RUN apt-get install -y curl wget
RUN apt-get install -y dnsmasq
RUN apt-get install -y supervisor

RUN mkdir --verbose --parents /usr/local/nginx/conf.docker.d
ADD src/conf.docker.d/* /usr/local/nginx/conf.docker.d/

ADD src/run.sh /opt/run.sh
ADD src/supervisor.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80
CMD bash -il /opt/run.sh
