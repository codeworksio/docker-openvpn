[![Circle CI](https://circleci.com/gh/codeworksio/docker-openvpn.svg?style=shield "CircleCI")](https://circleci.com/gh/codeworksio/docker-openvpn)&nbsp;[![Size](https://images.microbadger.com/badges/image/codeworksio/openvpn.svg)](http://microbadger.com/images/codeworksio/openvpn)&nbsp;[![Version](https://images.microbadger.com/badges/version/codeworksio/openvpn.svg)](http://microbadger.com/images/codeworksio/openvpn)&nbsp;[![Commit](https://images.microbadger.com/badges/commit/codeworksio/openvpn.svg)](http://microbadger.com/images/codeworksio/openvpn)&nbsp;[![Docker Hub](https://img.shields.io/docker/pulls/codeworksio/openvpn.svg)](https://hub.docker.com/r/codeworksio/openvpn/)

Docker OpenVPN
==============

Your private path to access network resources and services securely.

Installation
------------

Builds of the image are available on [Docker Hub](https://hub.docker.com/r/codeworksio/openvpn/).

    docker pull codeworksio/openvpn

Alternatively you can build the image yourself.

    docker build --tag codeworksio/openvpn \
        github.com/codeworksio/docker-openvpn

Quickstart
----------

Start container using:

    docker run --detach --restart always \
        --name openvpn \
        --hostname openvpn \
        codeworksio/openvpn

See
---

- [jpetazzo/dockvpn](https://github.com/jpetazzo/dockvpn)
- [kylemanna/docker-openvpn](https://github.com/kylemanna/docker-openvpn)
