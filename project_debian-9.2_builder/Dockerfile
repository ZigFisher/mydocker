#
# Create base system
FROM scratch
MAINTAINER Igor Zalatov "http://gravatar.com/flyrouter"
ADD debian_stretch_rootfs.tar.xz /
#
# Disable interactive
ENV DEBIAN_FRONTEND noninteractive
#
# Update and upgrade
RUN apt-get -y -u update && apt-get -y -u upgrade
#
# Install packages
RUN apt-get -y --no-install-recommends install apt-utils
RUN apt-get -y --no-install-recommends install systemd systemd-sysv \
  bsd-mailx cron git mc ntpdate openssh-server openssh-client ssmtp wget
#
# Install monitoring
RUN apt-get -y --no-install-recommends install nginx-light php-fpm fcgiwrap \
  icinga-core icinga icinga-cgi icinga-cgi-bin \
  monitoring-plugins-basic monitoring-plugins-standard
#
# Setup a simple & stupid root password.
RUN echo "root:youpass" | chpasswd
#
#RUN apt-get -y --no-install-recommends install etckeeper sudo screen
#RUN apt-get -y --no-install-recommends install iperf netcat upx
#RUN apt-get -y --no-install-recommends install [apt-utils dialog locales]
#
# Install openwrt building packages
RUN apt-get -y --no-install-recommends install build-essential gawk \
  libncurses-dev subversion unzip zlib1g-dev libssl-dev openssl curl \
  ca-certificates python flex gettext file gcc-multilib \
  tofrodos
#
# Create OpenWRT building user
RUN useradd -mU -d /home/builder -s /bin/bash builder
RUN echo "builder:mypass2016" | chpasswd
#
# Set timezone
RUN ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
RUN dpkg-reconfigure -f noninteractive tzdata
#
# Other
#RUN sed -i "/listen [::]:80 default_server;/d" "/etc/nginx/sites-available/default"
#
# Clean system
RUN apt-get -y clean && rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/* \
  /usr/share/{man,doc,info} /usr/{{lib,share}/locale}
#
# Expose the SSH port
EXPOSE 22 80
#
# Launch systemd
ENTRYPOINT ["/sbin/init"]
#



