Docker container (micro)
===


## Quick start
Clone my Docker projects repo:

	git clone https://github.com/ZigFisher/MyDocker.git

Go to micro project dir:

	cd MyDocker/project_micro

Create micro image for Docker:

	docker build -t micro .

Start micro container with "normal" name and hostname:

	docker run -d -P --restart=always --name micro --hostname micro micro

If you need connect to container run this command:

	docker exec -it micro sh
