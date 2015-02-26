#FROM ubuntu:trusty
FROM matsumotory/ngx-mruby

RUN apt-get update -y
RUN apt-get install -y nano nmap tree
RUN apt-get install -y curl wget

RUN apt-get install -y software-properties-common
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449
RUN add-apt-repository 'deb http://dl.hhvm.com/ubuntu trusty main'
RUN apt-get -y update
RUN apt-get install -y hhvm hhvm-fastcgi

RUN apt-get install -y supervisor
ADD supervisor.conf /etc/supervisor/conf.d/supervisord.conf

RUN wget "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar" -O /usr/local/bin/wp-cli.phar
RUN mv /usr/local/bin/wp-cli.phar /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp

RUN mkdir --verbose --parents /opt/wordpress
#ADD nginx.conf /usr/local/nginx/conf/nginx.conf

ONBUILD ADD wp-cli.sh /tmp/from_dockerfile/wp-cli.sh
ONBUILD RUN bash -l /tmp/from_dockerfile/wp-cli.sh

WORKDIR /opt/wordpress
EXPOSE 80
CMD /usr/bin/supervisord
