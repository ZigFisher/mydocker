FROM scratch
ADD alpine-minirootfs-3.5.0-x86_64.tar.gz /
RUN apk add --no-cache dropbear openrc sshpass
CMD ["/sbin/init"]
MAINTAINER Igor Zalatov "http://gravatar.com/flyrouter"
