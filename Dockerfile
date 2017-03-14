FROM alpine:3.5
#FROM google/nodejs
MAINTAINER ninthwalker <ninthwalker@gmail.com>

RUN apk --no-cache add \
nodejs \
bash

RUN mkdir -p /opt/hubot \
mkdir -p /.config \
chmod -R g+rwx /root/.config

WORKDIR /opt/hubot

RUN npm install -g hubot coffee-script yo generator-hubot

RUN add user -S node \
#RUN chown -R node /opt/hubot
#USER node

RUN yo hubot --owner="brentsflix" --name="Hubot" --description="Brentsflix Hubot" --adapter=slack --defaults --allow-root

RUN npm install hubot-slack
RUN npm install hubot-youtube

ADD external-scripts.json /opt/hubot/external-scripts.json

CMD ["./bin/hubot", "--adapter", "slack"]
