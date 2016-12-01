FROM scratch
MAINTAINER Igor Zalatov "http://gravatar.com/flyrouter"
ADD ../rootfs.tar.gz /
RUN apk search --no-cache dropbear sshpass && \
    rm -rf /var/cache/apk/*
CMD ["/sbin/init"]
