FROM mhart/alpine-node:slim-14

ENV NODE_VERSION 14.17.3

RUN apk add --no-cache make gcc g++ python bash

WORKDIR /var/fansi

COPY lib/ /var/fansi/lib/
COPY bin/ /var/fansi/bin/
COPY config/ /var/fansi/config/
COPY public/ /var/fansi/public/
COPY routes/ /var/fansi/routes/
COPY views/ /var/fansi/views/

COPY app.js /var/fansi/
COPY package.json /var/fansi/
COPY deploy.js /var/fansi/

RUN npm install

VOLUME /var/fansi/data

EXPOSE 1111
ENTRYPOINT ["npm", "start"]
