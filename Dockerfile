FROM node:6.11.3

RUN mkdir -p /data/app/bin && \
    mkdir -p /data/app/scripts && \
    mkdir -p /etc/apt/apt.conf.d

# If apt-get update fails and you are behind a proxy,
# you can try uncommenting the next line to fix it.
#ADD ./99fixbadproxy /etc/apt/apt.conf.d/99fixbadproxy

# Commented out for performance during class
#RUN apt-get -y update && apt-get -y upgrade

ADD ./bin /data/app/bin
ADD ./scripts /data/app/scripts
ADD ./*.json /data/app/

RUN cd /data/app && npm install

WORKDIR /data/app
CMD ["/data/app/bin/hubot-env"]

