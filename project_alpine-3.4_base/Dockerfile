FROM scratch
MAINTAINER Igor Zalatov "http://gravatar.com/flyrouter"
ADD alpine-3.4_docker.tar.gz /
RUN apk add --no-cache dropbear openrc sshpass && \
    rm -rf /var/cache/apk/*
CMD ["/sbin/init"]
