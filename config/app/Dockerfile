FROM vivekhash/ubuntu-pyapp:latest

MAINTAINER vivek

WORKDIR /home/vivek/pyapp.com

ENV HOST_PROJECT_HOME /home/vivek/pyapp.com

RUN apt-get update
RUN apt-get -y install python-pip

RUN mkdir -p /var/www/pyapp.com

COPY . /var/www/pyapp.com/

ENV CON_PROJECT_HOME /var/www/pyapp.com

RUN pip install django==1.8 gunicorn futures

EXPOSE 8000

COPY config/app/docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

