#!/usr/bin/make

IMAGE_NAME="docker-staging.imio.be/library/mutual:latest"
MID=bibliotheca

buildout.cfg:
	ln -fs dev.cfg buildout.cfg

bin/buildout: bin/pip buildout.cfg
	bin/pip install -I -r requirements.txt

buildout: bin/instance

bin/instance: bin/buildout
	bin/buildout

bin/pip:
	python3 -m venv .

run: bin/instance
	bin/instance fg



docker-image:
	docker build --pull -t library/mutual:latest .

eggs:  ## Copy eggs from docker image to speed up docker build
	-docker run --entrypoint='' $(IMAGE_NAME) tar -c -C /plone eggs | tar x
	mkdir -p eggs

cleanall:
	rm -fr develop-eggs downloads eggs parts .installed.cfg lib include bin .mr.developer.cfg local/

rsync:
	rsync -P imio@bibliotheca.imio.be:/srv/instances/sambreville/filestorage/Data.fs var/filestorage/Data.fs
	rsync -r --info=progress2 imio@bibliotheca.imio.be:/srv/instances/sambreville/blobstorage/ var/blobstorage/

bash:
	docker-compose run --rm -p 8080:8080 -u imio instance bash

migration-start:
	rm -rf var/filestorage/Data.fs
	rm -rf var/blobstorage/*
	make cleanall
	rsync -P imio@bibliotheca.imio.be:/srv/instances/$(MID)/filestorage/Data.fs var/filestorage/Data.fs
	rsync -r --info=progress2 imio@bibliotheca.imio.be:/srv/instances/$(MID)/blobstorage/ var/blobstorage/
	if [ -f /usr/bin/virtualenv-2.7 ] ; then virtualenv-2.7 .;else virtualenv -p python2.7 .;fi
	bin/pip install -I -r requirements.txt
	bin/buildout -c migration.cfg
	bin/zeoserver start
	bin/instance start
	xdg-open http://localhost:8080
migration-end:
	bin/zeopack
	bin/instance stop
	bin/zeoserver stop
	make cleanall
	python3 -m venv .
	bin/pip install -I -r requirements.txt
	./bin/buildout -c migration.cfg
	./bin/zodbupdate --convert-py3 --file=var/filestorage/Data.fs --encoding utf8 --encoding-fallback latin1
	bin/zodbverify -f var/filestorage/Data.fs

rsync-upload:
	rsync -P var/filestorage/Data.fs imio@bibliotheca.imio.be:/srv/instances/$(MID)/filestorage/Data.fs
	rsync -r --info=progress2 var/blobstorage/ imio@bibliotheca.imio.be:/srv/instances/$(MID)/blobstorage/
