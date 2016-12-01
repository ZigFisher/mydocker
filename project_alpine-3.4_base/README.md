Alpine-3.4_base <=> Docker
==========================

## Example start

Clone my Docker projects repo:

	git clone https://github.com/ZigFisher/MyDocker.git

Go to project dir:

	cd MyDocker/project_alpine-3.4_base

Create image:

	docker build -t alpine-3.4_base .

Start container with "normal" name and hostname:

	docker run -d -p 2051:22/tcp --name alpine-3.4_base --hostname alpine-3.4_base alpine-3.4_base

If you need connect to container run this command:

	docker exec -it alpine-3.4_base sh

Quick uninstall:

	docker stop alpine-3.4_base && docker rm alpine-3.4_base && docker rmi alpine-3.4_base

