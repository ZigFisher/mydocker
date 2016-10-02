Docker container for [slack-irc](https://github.com/ekmartin/slack-irc)
===
[![Docker Hub](https://img.shields.io/badge/docker-ready-blue.svg)](https://registry.hub.docker.com/u/chihchun/slack-ircbridge/) 
[![](https://images.microbadger.com/badges/image/chihchun/slack-ircbridge.svg)](https://microbadger.com/images/chihchun/slack-ircbridge)
[![Join the chat at https://gitter.im/chihchun/slack-ircbridge-docker](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/chihchun/slack-ircbridge-docker?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## Run
Copy `slack-irc/config.json.sample` to `slack-irc/config.json` and change the config.

### Example configuration
```js
[
  // Bot 1 (minimal configuration):
  {
    "nickname": "test2",
    "server": "irc.testbot.org",
    "token": "slacktoken2",
    "channelMapping": {
      "#other-slack": "#new-irc-channel"
    }
  },

  // Bot 2 (advanced options):
  {
    "nickname": "test",
    "server": "irc.bottest.org",
    "token": "slacktoken", // Your bot user's token
    "autoSendCommands": [ // Commands that will be sent on connect
      ["PRIVMSG", "NickServ", "IDENTIFY password"],
      ["MODE", "test", "+x"],
      ["AUTH", "test", "password"]
    ],
    "channelMapping": { // Maps each Slack-channel to an IRC-channel, used to direct messages to the correct place
      "#slack": "#irc channel-password", // Add channel keys after the channel name
      "privategroup": "#other-channel" // No hash in front of private groups
    },
    "ircOptions": { // Optional node-irc options
      "floodProtection": false, // On by default
      "floodProtectionDelay": 1000 // 500 by default
    },
    // Makes the bot hide the username prefix for messages that start
    // with one of these characters (commands):
    "commandCharacters": ["!", "."]
  }
]
```

`ircOptions` is passed directly to node-irc ([available options](http://node-irc.readthedocs.org/en/latest/API.html#irc.Client)).



```
docker pull chihchun/slack-ircbridge
docker run -d -t --rm -v ${PWD}/slack-irc:/slack-irc chihchun/slack-ircbridge
```

# Build from source

Build the docker container or pull from internet

```
docker build -t slack-ircbridge .
```

# Credit
* [slack-irc](https://github.com/ekmartin/slack-irc)
* Docker container for slack-irc https://github.com/caktux/slackbridge
