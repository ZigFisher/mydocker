FROM node:0.12.7
MAINTAINER ZigFisher "https://about.me/flyrouter"

# Slack irc version.
ENV SLACK_IRC_VERSION=3.5.2

# Usual update / upgrade
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y --no-install-recommends install supervisor mc

# Get slack-irc
RUN npm install -g slack-irc@${SLACK_IRC_VERSION}

# Add configurations
ADD config/config.json slack-irc/config.json
ADD config/supervisord.conf supervisord.conf

# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
CMD ["/usr/bin/supervisord", "-n", "-c", "/supervisord.conf"]
