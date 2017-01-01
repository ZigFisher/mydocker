FROM scratch
ADD alpine-minirootfs-3.5.0-x86_64.tar.gz /
RUN apk add --no-cache dropbear dropbear-dbclient openrc
RUN apk add --no-cache mc sshpass
RUN rc-update add dropbear
#RUN rc-service dropbear start
RUN ln /usr/bin/dbclient /usr/bin/ssh
RUN echo "root:alpine" | chpasswd
RUN echo -e "Welcome to Alpine micro-server !\n" >/etc/motd
CMD ["/sbin/init"]
MAINTAINER Igor Zalatov "http://gravatar.com/flyrouter"
