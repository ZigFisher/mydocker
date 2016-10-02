Docker container for [slack-irc](https://github.com/ekmartin/slack-irc)
===
[![Docker Hub](https://img.shields.io/badge/docker-ready-blue.svg)](https://registry.hub.docker.com/u/chihchun/slack-ircbridge/) 
[![](https://images.microbadger.com/badges/image/chihchun/slack-ircbridge.svg)](https://microbadger.com/images/chihchun/slack-ircbridge)
[![Join the chat at https://gitter.im/chihchun/slack-ircbridge-docker](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/chihchun/slack-ircbridge-docker?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)


## Quick start
Clone repo

`git clone https://github.com/ZigFisher/MyDocker.git`


### Example configuration
```js
[
  {
    "nickname": "irc-to-slack",
    "server": "irc.forestnet.org",
    "token": "insert-slack-token-here",
    "channelMapping": {
      "#wifi-iot": "#esp8266"
    }
  }
]
```

