FROM scratch
MAINTAINER Igor Zalatov "http://gravatar.com/flyrouter"
ADD alpine-minirootfs-3.5.0-x86_64.tar.gz /

RUN apk add --no-cache dropbear dropbear-dbclient dropbear-scp openrc
RUN apk add --no-cache mc sshpass rsync ssmtp

RUN sed -i "/need net/d" "/etc/init.d/dropbear"
RUN ln /usr/bin/dbclient /usr/bin/ssh
RUN echo "root:alpine" | chpasswd
RUN echo -e "Welcome to Alpine node-red server !\n" >/etc/motd
RUN rc-update add dropbear

RUN apk add --no-cache ca-certificates nodejs python
RUN npm install -g node-red
RUN npm install -g node-red-dashboard

CMD ["/sbin/init"]
