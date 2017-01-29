Alpine-3.5.0_slack-irc => Docker
================================

## Example start

Clone my Docker projects repo:

	git clone https://github.com/ZigFisher/MyDocker.git

Go to project dir:

	cd MyDocker/project_alpine-3.5.0_slack-irc

Create image:

	docker build -t alpine-3.5.0_slack-irc .

Start container with "normal" name and hostname:

	docker run -d --restart=always -p 2052:22/tcp --name alpine-3.5.0_slack-irc --hostname alpine-slackirc alpine-3.5.0_slack-irc

If you need connect to container run this command:

	docker exec -it alpine-3.5.0_slack-irc sh

Quick uninstall:

	docker stop alpine-3.5.0_slack-irc && docker rm alpine-3.5.0_slack-irc && docker rmi alpine-3.5.0_slack-irc

Source links:

	https://www.alpinelinux.org/downloads/
	https://fr.alpinelinux.org/alpine/v3.5/releases/x86_64/alpine-minirootfs-3.5.0-x86_64.tar.gz
