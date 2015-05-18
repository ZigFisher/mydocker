FROM scratch

MAINTAINER Igor Zalatov <flyrouter@gmail.com>

ADD rootfs.tar.xz /

RUN export TERM=xterm


# Update, upgrade and clean
#
RUN apt-get -qq -y -u update && apt-get -qq -y -u upgrade && apt-get -qq -y clean


# Install packages
#
RUN apt-get -qq -y install runit
RUN apt-get -qq -y --no-install-recommends install sudo screen mc
RUN apt-get -qq -y --no-install-recommends install openssh-server openssh-client --yes --force-yes


# Setup a root password; simple enough to remember, but hard enough that
# it won't be cracked immediately.  (ha!)
#
RUN echo "root:mypasswd" | chpasswd


# Expose the SSH port
#
EXPOSE 22

#
#  Now make sure that runit will launch SSHD, via runit.
#
#  NOTE: Remember runit will launch /etc/service/sshd/run
#
RUN mkdir /etc/service/sshd
RUN /bin/echo -e '#!/bin/sh' > /etc/service/sshd/run
RUN /bin/echo -e 'exec /usr/sbin/sshd -D' >> /etc/service/sshd/run


#  Make sure our run-script is executable.
#
RUN chown root.root /etc/service/sshd/run && chmod 755 /etc/service/sshd/run


# Clean system
#
RUN apt-get -qq -y clean


# Launch runit.
#
ENTRYPOINT ["/usr/sbin/runsvdir-start"]
