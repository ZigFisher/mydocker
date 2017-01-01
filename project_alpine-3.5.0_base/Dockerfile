FROM scratch
MAINTAINER Igor Zalatov "http://gravatar.com/flyrouter"
ADD alpine-minirootfs-3.5.0-x86_64.tar.gz /

RUN apk add --no-cache dropbear dropbear-dbclient openrc
RUN apk add --no-cache mc sshpass

RUN sed -i "/need net/d" "/etc/init.d/dropbear"
RUN ln /usr/bin/dbclient /usr/bin/ssh
RUN echo "root:alpine" | chpasswd
RUN echo -e "Welcome to Alpine micro server !\n" >/etc/motd
RUN rc-update add dropbear

CMD ["/sbin/init"]
