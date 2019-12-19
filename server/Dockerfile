FROM node:13

WORKDIR /showfeeder-server

# TODO: Figure out Dockerfile secrets for configs.js file
COPY . /showfeeder-server

RUN npm install && \
    npm instal -g forever

CMD forever server.js
