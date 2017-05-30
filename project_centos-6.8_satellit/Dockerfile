FROM scratch
MAINTAINER Igor Zalatov "http://gravatar.com/flyrouter"
ADD centos-6.8_docker.tar.xz /
RUN yum -y update
RUN yum -y install git mc openssh-server wget
#RUN yum -y install bsd-mailx ssmtp
#RUN yum -y remove sendmail
RUN echo "root:satellit" | chpasswd
RUN git clone https://github.com/carbonsoft/reductor_satellite_installer.git /opt/reductor_satellite_installer/ && \
    /opt/reductor_satellite_installer/install.sh
RUN rm -f /etc/localtime; ln -s /usr/share/zoneinfo/Europe/Moscow /etc/localtime
CMD ["/sbin/init"]
