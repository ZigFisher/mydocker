FROM scratch
MAINTAINER Igor Zalatov "http://gravatar.com/flyrouter"
ADD centos-6.8_docker.tar.xz /
RUN yum -y install mc openssh-server
RUN yum -y install bsd-mailx ssmtp
RUN yum -y remove sendmail
RUN rm -f /etc/localtime; ln -s /usr/share/zoneinfo/Europe/Moscow /etc/localtime
CMD ["/sbin/init"]
