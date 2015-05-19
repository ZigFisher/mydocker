# Create base system
FROM scratch
MAINTAINER Igor Zalatov <flyrouter@gmail.com>
ADD rootfs.tar.xz /

# Disable interactive
ENV DEBIAN_FRONTEND noninteractive

# Set timezone
RUN echo "Europe/Simferopol" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# Resolve problem with execution policy-rc.d
RUN echo "exit 0" > /usr/sbin/policy-rc.d && chmod +x /usr/sbin/policy-rc.d

# Update and upgrade
RUN apt-get -qq -y -u update && apt-get -qq -y -u upgrade

# Install packages
RUN apt-get -qq -y --no-install-recommends install apt-utils runit
RUN apt-get -qq -y --no-install-recommends install ssmtp bsd-mailx ntpdate
RUN apt-get -qq -y --no-install-recommends install git etckeeper sudo screen mc
RUN apt-get -qq -y --no-install-recommends install openssh-server openssh-client
RUN apt-get -qq -y --no-install-recommends install cron
RUN apt-get -qq -y --no-install-recommends install nginx
RUN apt-get -qq -y --no-install-recommends install icinga-core icli

# Setup a simple & stupid root password
RUN echo "root:mypasswd" | chpasswd

# Expose the SSH port
EXPOSE 22

# Now make sure that runit will launch SSHD, via runit.
RUN mkdir -p /etc/service/sshd /var/run/sshd
RUN /bin/echo -e '#!/bin/sh' > /etc/service/sshd/run
RUN /bin/echo -e 'exec 2>&1' >> /etc/service/sshd/run
RUN /bin/echo -e 'exec /usr/sbin/sshd -D' >> /etc/service/sshd/run

# Now make sure that runit will launch CRON, via runit.
RUN mkdir -p /etc/service/cron /var/run/cron
RUN /bin/echo -e '#!/bin/sh' > /etc/service/cron/run
RUN /bin/echo -e 'exec 2>&1' >> /etc/service/cron/run
RUN /bin/echo -e 'exec /usr/sbin/cron -f' >> /etc/service/cron/run

# Now make sure that runit will launch ICINGA, via runit.
RUN mkdir -p /etc/service/icinga /var/run/icinga
RUN /bin/echo -e '#!/bin/sh' > /etc/service/icinga/run
RUN /bin/echo -e 'exec 2>&1' >> /etc/service/icinga/run
RUN /bin/echo -e 'exec /usr/sbin/icinga /etc/icinga/icinga.cfg' >> /etc/service/icinga/run

# Make sure our run-script is executable.
RUN chown root.root /etc/service/*/run && chmod 755 /etc/service/*/run

# Clean system
RUN apt-get -qq -y clean

# Launch runit.
ENTRYPOINT ["/usr/sbin/runsvdir-start"]
