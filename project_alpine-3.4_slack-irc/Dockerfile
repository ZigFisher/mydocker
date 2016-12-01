FROM scratch
MAINTAINER Igor Zalatov "http://gravatar.com/flyrouter"
ADD alpine-3.4_docker.tar.gz /
RUN apk add --no-cache dropbear mc nodejs openrc python && \
    rm -rf /var/cache/apk/*
RUN npm install -g slack-irc@3.9.0
RUN mkdir -p /etc/slack-irc
CMD ["/sbin/init"]
