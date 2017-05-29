Centos-6.8_satellit <=> Docker
==============================

## Example start

Clone my Docker projects repo:

	git clone https://github.com/ZigFisher/MyDocker.git

Go to project dir:

	cd MyDocker/project_centos-6.8_satellit

Create image:

	docker build -t centos-6.8_satellit .

Start container with "normal" name and hostname:

	docker run -d --restart=always -p 2054:22/tcp --name centos-6.8_satellit --hostname centos-satellit centos-6.8_satellit

If you need connect to container run this command:

	docker exec -it centos-6.8_satellit bash

Quick uninstall:

	docker stop centos-6.8_satellit && docker rm centos-6.8_satellit && docker rmi centos-6.8_satellit

