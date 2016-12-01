Docker container (openwrt)
===


## Quick start
Clone my Docker projects repo:

	git clone https://github.com/ZigFisher/MyDocker.git

Go to openwrt project dir:

	cd MyDocker/project_openwrt

Create openwrt image for Docker:

	docker build -t openwrt .

Start openwrt container with "normal" name and hostname:

	docker run -d -P --restart=always --name openwrt --hostname openwrt openwrt

If you need connect to container run this command:

	docker exec -it openwrt sh
