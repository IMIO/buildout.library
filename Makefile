#!/usr/bin/make

build-dev: bin/python
	ln -fs dev.cfg buildout.cfg
	bin/pip install -I -r requirements.txt
	bin/buildout

build-prod: bin/python
	ln -fs prod.cfg buildout.cfg
	bin/pip install -I -r requirements.txt
	bin/buildout

build: build-dev

bin/pip:
	if [ -f /usr/bin/virtualenv-2.7 ] ; then virtualenv-2.7 .;else virtualenv -p python2.7 .;fi

run: bin/instance
	bin/instance fg

docker-image:
	docker build --pull -t docker-staging.imio.be/library/mutual:latest .
