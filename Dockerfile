FROM codeworksio/ubuntu:latest

ARG APT_PROXY
ARG APT_PROXY_SSL
ENV OPENVPN_VERSION="2.4"

RUN set -ex \
    \
    && if [ -n "$APT_PROXY" ]; then echo "Acquire::http { Proxy \"http://${APT_PROXY}\"; };" > /etc/apt/apt.conf.d/00proxy; fi \
    && if [ -n "$APT_PROXY_SSL" ]; then echo "Acquire::https { Proxy \"https://${APT_PROXY_SSL}\"; };" > /etc/apt/apt.conf.d/00proxy; fi \
    && curl https://swupdate.openvpn.net/repos/repo-public.gpg | apt-key add - \
    && echo "deb http://build.openvpn.net/debian/openvpn/release/$OPENVPN_VERSION $(cat /etc/lsb-release | grep '^DISTRIB_CODENAME' | awk -F= '{ print $2 }') main" > /etc/apt/sources.list.d/openvpn.list \
    && apt-get --yes update \
    && apt-get --yes --no-install-recommends install \
        easy-rsa \
        iptables \
        openvpn=${OPENVPN_VERSION}* \
    \
    && rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/* /var/cache/apt/* \
    && rm -f /etc/apt/apt.conf.d/00proxy

VOLUME [ "/etc/openvpn" ]
EXPOSE 443/tcp 1194/udp 8080/tcp

COPY assets/sbin/openvpn.sh /sbin/openvpn.sh
CMD [ "/sbin/openvpn.sh" ]

### METADATA ###################################################################

ARG VERSION
ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL
LABEL \
    version=$VERSION \
    build-date=$BUILD_DATE \
    vcs-ref=$VCS_REF \
    vcs-url=$VCS_URL \
    license="MIT"
