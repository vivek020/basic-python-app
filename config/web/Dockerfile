FROM vivekhash/ubuntu-nginx:latest

MAINTAINER vivek

WORKDIR .

RUN apt-get update
RUN apt-get -y install nginx

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
COPY config/web/nginx.conf /etc/nginx/nginx.conf
COPY config/web/pyapp.com /etc/nginx/sites-available/default

EXPOSE 80

COPY config/web/docker-entrypoint.sh /

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

ENTRYPOINT ["/docker-entrypoint.sh"]


