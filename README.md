MyDocker
========

My view of the Docker project's (pre-alpha version).


License
=======

This script is free software; you can redistribute it and/or modify it under the terms of
the GNU Lesser General Public License as published by the Free Software Foundation;
either version 2.1 of the License, or (at your option) any later version.

You should have received a copy of the GNU Lesser General Public License along with this
script; if not, please visit http://www.gnu.org/copyleft/gpl.html for more information.


Quick Start
===========

	# Download repo
	git clone https://github.com/ZigFisher/MyDocker.git

	# Build image from Dockerfile
	docker build -t project .

	# You can see new builded image (project)
	docker images

	# Create and start container
	docker run -d -p 1022:22/tcp --name project --hostname project project

	# You can see new runing container (project)
	docker ps -a

	# Enjoy ! >;)
