FROM vivekhash/ubuntu-pyapp:latest

MAINTAINER vivek

RUN apt-get update
RUN apt-get -y install python-pip

ENV CON_PROJECT_HOME /var/www/pyapp.com

RUN mkdir -p $CON_PROJECT_HOME

COPY . /var/www/pyapp.com/

RUN pip install django==1.8 gunicorn futures

EXPOSE 8000

COPY config/app/docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

