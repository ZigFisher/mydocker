FROM scratch
MAINTAINER Igor Zalatov "http://gravatar.com/flyrouter"
ADD alpine-minirootfs-3.6.2-x86_64.tar.gz /

RUN apk add --no-cache dropbear dropbear-ssh dropbear-scp openrc
RUN apk add --no-cache mc sshpass rsync ssmtp

RUN sed -i "/need net/d" "/etc/init.d/dropbear"
RUN echo "root:alpine" | chpasswd
RUN echo -e "Welcome to Alpine micro server !\n" >/etc/motd
RUN rc-update add dropbear

CMD ["/sbin/init"]
