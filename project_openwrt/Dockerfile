# Create base system
FROM scratch
MAINTAINER Igor Zalatov <flyrouter@gmail.com>
ADD debian_jessie_rootfs.tar.xz /
#
# Disable interactive
ENV DEBIAN_FRONTEND noninteractive
#
# Set timezone
RUN echo "Europe/Simferopol" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
#
# Resolve problem with execution policy-rc.d
RUN echo "exit 0" > /usr/sbin/policy-rc.d && chmod +x /usr/sbin/policy-rc.d
#
# Update and upgrade
RUN apt-get -y -u update && apt-get -y -u upgrade
#
# Install packages
RUN apt-get -y --no-install-recommends install apt-utils runit
RUN apt-get -y --no-install-recommends install ssmtp bsd-mailx ntpdate
RUN apt-get -y --no-install-recommends install git etckeeper sudo screen mc
RUN apt-get -y --no-install-recommends install openssh-server openssh-client
RUN apt-get -y --no-install-recommends install git wget iperf netcat
RUN apt-get -y --no-install-recommends install cron
RUN apt-get -y --no-install-recommends install nginx
RUN apt-get -y --no-install-recommends install icinga-core icli
RUN apt-get -y --no-install-recommends install upx
RUN apt-get -y --no-install-recommends install ssmtp bsd-mailx
RUN dpkg --purge postfix
#
RUN apt-get -y --no-install-recommends dialog locales
#
# Install openwrt building packages
RUN apt-get -y --no-install-recommends install build-essential gawk libncurses-dev subversion unzip zlib1g-dev 
RUN apt-get -y --no-install-recommends install libssl-dev openssl curl ca-certificates python flex gettext file
RUN apt-get -y --no-install-recommends install gcc-multilib
#
# Setup a simple & stupid root password.
RUN echo "root:mypass2016" | chpasswd
#
# Create OpenWRT building user
RUN useradd -mU -d /home/builder -s /bin/bash builder
RUN echo "builder:mypass2016" | chpasswd
#
# Expose the SSH port
EXPOSE 22
#
# Now make sure that runit will launch SSHD, via runit.
RUN mkdir -p /etc/service/sshd /var/run/sshd
RUN /bin/echo -e '#!/bin/sh' > /etc/service/sshd/run
RUN /bin/echo -e 'exec 2>&1' >> /etc/service/sshd/run
RUN /bin/echo -e 'exec /usr/sbin/sshd -D' >> /etc/service/sshd/run
#FILE: /etc/ssh/sshd_config
#SET:  PermitRootLogin yes
#
# Now make sure that runit will launch VTUND, via runit.
RUN mkdir -p /etc/service/vtund /var/run/vtund
RUN /bin/echo -e '#!/bin/sh' > /etc/service/vtund/run
RUN /bin/echo -e 'exec 2>&1' >> /etc/service/vtund/run
RUN /bin/echo -e 'exec /usr/local/sbin/vtund -n -f /etc/vtund.conf openwrt vbox3.flymon.net -P 5000' >> /etc/service/vtund/run
#
# Now make sure that runit will launch CRON, via runit.
RUN mkdir -p /etc/service/cron /var/run/cron
RUN /bin/echo -e '#!/bin/sh' > /etc/service/cron/run
RUN /bin/echo -e 'exec 2>&1' >> /etc/service/cron/run
RUN /bin/echo -e 'exec /usr/sbin/cron -f' >> /etc/service/cron/run
#
# Now make sure that runit will launch ICINGA, via runit.
RUN mkdir -p /etc/service/icinga /var/run/icinga
RUN /bin/echo -e '#!/bin/sh' > /etc/service/icinga/run
RUN /bin/echo -e 'exec 2>&1' >> /etc/service/icinga/run
RUN /bin/echo -e 'exec /usr/sbin/icinga /etc/icinga/icinga.cfg' >> /etc/service/icinga/run
#
# Make sure our run-script is executable.
RUN chown root.root /etc/service/*/run && chmod 755 /etc/service/*/run
#
# Clean system
RUN apt-get -y clean
#RUN rm -rf usr/{{lib,share}/locale} usr/share/{man,doc,info}
#
# Launch runit.
ENTRYPOINT ["/usr/sbin/runsvdir-start"]
#
