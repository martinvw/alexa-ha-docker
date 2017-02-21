# ALEXA HOME AUTOMATION Docker image

[![Docker Stars](https://img.shields.io/docker/stars/martinvw/alexa-ha.svg)](https://hub.docker.com/r/martinvw/alexa-ha/)  [![Docker Pulls](https://img.shields.io/docker/pulls/martinvw/alexa-ha.svg)](https://hub.docker.com/r/martinvw/alexa-ha/)  [![Docker Automated buil](https://img.shields.io/docker/automated/martinvw/alexa-ha.svg)](https://hub.docker.com/r/martinvw/alexa-ha/)  ![GitHub forks](https://img.shields.io/github/forks/martinvw/alexa-ha-docker.svg?style=social&label=Fork) ![GitHub stars](https://img.shields.io/github/stars/martinvw/alexa-ha-docker.svg?style=social&label=Star)

## Supported tags and respective ```Dockerfile``` links

* latest (https://raw.githubusercontent.com/martinvw/alexa-ha-docker/master/Dockerfile)

This image is updated via pull requests to the [martinvw/alexa-ha-docker](https://github.com/martinvw/alexa-ha-docker) GitHub repo.

## What is ALEXA HOME AUTOMATION

Alexa HA provides tight integration between Amazon Echo and your Home Automation. This free and open source Skill for has been developed using the Alexa Skills Kit. Amazon Echo combined with the Alexa-HA Skill and a supported Home Automation solution delivers voice control and verbal feedback for practically anything in your home and beyond!

[source](https://github.com/unityfire/alexa-ha)

## How to use the image (command line)

> $ docker run --name alexa-ha -v /home/martinvw/config.js:/etc/alexa-ha-config.js -d martinvw/alexa-ha

### Exposing the port

If you don't use another docker to the SSL offloading then you might want to expose the port:

> $ docker run --name alexa-ha -v /home/martinvw/config.js:/etc/alexa-ha-config.js -d -p 9999:8080 alexa-ha

Then you can hit http://localhost:9999 or http://host-ip:9999 in your browser.

## Using Docker-compose

Create the following ```docker-compose.yml``` and start the container with ```docker-compose up -d```

```
version: "3"
 services:
   alexa-ha:
      image: martinvw/alexa-ha
      ports:
       - "9999:8000"
      volumes:
       - /home/martinvw/config.js:/etc/alexa-ha-config.js
```

## Supported Docker versions

This image is officially supported on Docker version 1.13.1.

Support for older versions (down to 1.6) is provided on a best-effort basis.

## User Feedback

### Issues

If you have any problems with or questions about this image, please contact us through a [GitHub issue](https://github.com/martinvw/alexa-ha-docker/issues).

### Contributing

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub issue](https://github.com/martinvw/alexa-ha-docker/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.

## Documentation

## License

When not explicitly set, files are placed under [![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](http://www.gnu.org/licenses/gpl-3.0)
