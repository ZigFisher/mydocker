Centos-6.8_satellite <=> Docker
===============================

## Example start

Clone my Docker projects repo:

	git clone https://github.com/ZigFisher/MyDocker.git

Go to project dir:

	cd MyDocker/project_centos-6.8_satellite

Create image:

	docker build -t centos-6.8_satellite .

Start container with "normal" name and hostname:

	docker run -d --restart=always -p 2055:22/tcp --name centos-6.8_satellite --hostname centos-satellite centos-6.8_satellite

If you need connect to container run this command:

	docker exec -it centos-6.8_satellite bash

Quick uninstall:

	docker stop centos-6.8_satellite && docker rm centos-6.8_satellite && docker rmi centos-6.8_satellite

