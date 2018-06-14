#!/usr/bin/make

build-dev: bin/python
	ln -fs dev.cfg buildout.cfg
	./bin/buildout

build-prod: bin/python
	ln -fs prod.cfg buildout.cfg
	./bin/buildout

bin/python:
	virtualenv-2.7 .

run: bin/instance
	bin/instance fg
