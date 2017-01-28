Alpine-3.5.0_nodered => Docker
==============================

## Example start

Clone my Docker projects repo:

	git clone https://github.com/ZigFisher/MyDocker.git

Go to project dir:

	cd MyDocker/project_alpine-3.5.0_nodered

Create image:

	docker build -t alpine-3.5.0_nodered .

Start container with "normal" name and hostname:

	docker run -d --restart=always -p 2051:22/tcp -p 1880:1880/tcp --name alpine-3.5.0_nodered --hostname alpine_nodered alpine-3.5.0_nodered

If you need connect to container run this command:

	docker exec -it alpine-3.5.0_nodered sh

Quick uninstall:

	docker stop alpine-3.5.0_nodered && docker rm alpine-3.5.0_nodered && docker rmi alpine-3.5.0_nodered

Source links:

	https://www.alpinelinux.org/downloads/
	https://fr.alpinelinux.org/alpine/v3.5/releases/x86_64/alpine-minirootfs-3.5.0-x86_64.tar.gz
