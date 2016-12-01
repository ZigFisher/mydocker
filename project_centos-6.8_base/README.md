Centos-6.8_base <=> Docker
==========================

## Example start

Clone my Docker projects repo:

	git clone https://github.com/ZigFisher/MyDocker.git

Go to project dir:

	cd MyDocker/project_centos-6.8_base

Create image:

	docker build -t centos-6.8_base .

Start container with "normal" name and hostname:

	docker run -d --restart=always -p 2053:22/tcp --name centos-6.8_base --hostname centos-6.8_base centos-6.8_base

If you need connect to container run this command:

	docker exec -it centos-6.8_base sh

Quick uninstall:

	docker stop centos-6.8_base && docker rm centos-6.8_base && docker rmi centos-6.8_base

