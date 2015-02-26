FROM matsumotory/ngx-mruby

RUN apt-get update -y
RUN apt-get install -y nano nmap tree
RUN apt-get install -y curl wget

#ADD src/nginx.conf /usr/local/nginx/conf/nginx.conf
RUN mkdir --verbose --parents /usr/local/nginx
ADD conf.docker.d /usr/local/nginx/

#VOLUME ["/usr/local/nginx/conf.docker.d"]
EXPOSE 80
