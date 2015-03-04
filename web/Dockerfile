#FROM ubuntu:trusty
FROM matsumotory/ngx-mruby

RUN apt-get update -y

RUN apt-get install -y software-properties-common
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449
RUN add-apt-repository 'deb http://dl.hhvm.com/ubuntu trusty main'

RUN apt-get -y update

RUN apt-get install -y nano nmap tree
RUN apt-get install -y curl wget
RUN apt-get install -y supervisor
RUN apt-get install -y mysql-client

RUN apt-get install -y hhvm hhvm-fastcgi
RUN apt-get install -y php5-cli php5-mysql
RUN update-alternatives --set php $(which hhvm)

RUN wget "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar" -O /usr/local/bin/wp-cli.phar
RUN mv /usr/local/bin/wp-cli.phar /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN chmod +x /usr/local/bin/composer

RUN touch /opt/wp_debug.log
RUN touch /usr/local/nginx/logs/error.log
RUN touch /usr/local/nginx/logs/access.log


ADD supervisor.conf /etc/supervisor/conf.d/supervisord.conf
ADD docker/run.sh /opt/wordpress.sh

ADD wp-cli_install.sh /opt/wp-cli_install.sh
ADD wp-cli_check.sh /opt/wp-cli_check.sh
ADD composer.json /opt/composer.json.copyme

VOLUME ["/opt/wordpress"]
WORKDIR /opt/wordpress
EXPOSE 80
CMD bash -il -c "supervisord"
