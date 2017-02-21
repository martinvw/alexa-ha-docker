FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
  curl \
  git
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get update && apt-get install -y nodejs
RUN useradd -ms /bin/bash alexa

# Switch to newly created user
USER alexa
WORKDIR /home/alexa

RUN npm install alexa-app alexa-app-server request
RUN cp -R /home/alexa/node_modules/alexa-app-server/examples/ /home/alexa/node_modules/alexa-app-server/api/ && \
       rm -rf /home/alexa/node_modules/alexa-app-server/api/apps/* && \
       cd /home/alexa/node_modules/alexa-app-server/api/apps/ && \
       git clone -b master https://github.com/unityfire/alexa-ha.git && \
       rm /home/alexa/node_modules/alexa-app-server/api/server.js && \
       ln -s /etc/alexa-ha-config.js /home/alexa/node_modules/alexa-app-server/api/apps/alexa-ha/config.js

COPY server.js /home/alexa/node_modules/alexa-app-server/api/server.js

EXPOSE 8080

CMD cd /home/alexa/node_modules/alexa-app-server/api/ && node server.js
