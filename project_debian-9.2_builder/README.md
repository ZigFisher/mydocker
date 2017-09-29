Debian-9.2_builder => Docker
============================

## Example start

Clone my Docker projects repo:

	git clone https://github.com/ZigFisher/MyDocker.git

Go to project dir:

	cd MyDocker/project_debian-9.2_builder

Create image:

	docker build -t debian-9.2_builder .

Start container with "normal" name and hostname:

	docker run -d --cap-add=SYS_ADMIN --restart=always -p 2052:22/tcp --name debian-9.2_builder --hostname debian-builder debian-9.2_builder

If you need connect to container run this command:

	docker exec -it debian-9.2_builder bash

Quick uninstall:

	docker stop debian-9.2_builder && docker rm debian-9.2_builder && docker rmi debian-9.2_builder

Source links:

	https://github.com/debuerreotype/docker-debian-artifacts/raw/dist-amd64/stretch/slim/rootfs.tar.xz