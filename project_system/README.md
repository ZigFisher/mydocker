Docker container (system)
===


## Quick start
Clone my Docker projects repo:

	git clone https://github.com/ZigFisher/MyDocker.git

Go to system project dir:

	cd MyDocker/project_system

Create system image for Docker:

	docker build -t system .

Start system container with "normal" name and hostname:

	docker run -d -P --restart=always --name system --hostname system system

If you need connect to container run this command:

	docker exec -it system sh
