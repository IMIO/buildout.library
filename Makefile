#!/usr/bin/make
buildout.cfg:
	ln -fs dev.cfg buildout.cfg

bin/buildout: bin/pip buildout.cfg
	bin/pip install -I -r requirements.txt

buildout: bin/buildout

bin/instance: bin/buildout
	bin/buildout

bin/pip:
	python3 -m venv .

run: bin/instance
	bin/instance fg

docker-image:
	docker build --pull -t library/mutual:latest .

cleanall:
	rm -fr develop-eggs downloads eggs parts .installed.cfg lib include bin .mr.developer.cfg local/

rsync:
	rsync -P imio@bibliotheca.imio.be:/srv/instances/sambreville/filestorage/Data.fs var/filestorage/Data.fs
	rsync -r --info=progress2 imio@bibliotheca.imio.be:/srv/instances/sambreville/blobstorage/ var/blobstorage/

bash:
	docker-compose run --rm -p 8080:8080 -u imio instance bash

migration-sambreville:
	make cleanall
	# rsync -P imio@bibliotheca.imio.be:/srv/instances/sambreville/filestorage/Data.fs var/filestorage/Data.fs
	# rsync -r --info=progress2 imio@bibliotheca.imio.be:/srv/instances/sambreville/blobstorage/ var/blobstorage/
	if [ -f /usr/bin/virtualenv-2.7 ] ; then virtualenv-2.7 .;else virtualenv -p python2.7 .;fi
	bin/pip install -I -r requirements.txt
	bin/buildout -c migration.cfg
	bin/zeoserver start
	bin/instance -O plone run scripts/run_portal_upgrades.py
	bin/zeopack
	bin/zeoserver stop
	make cleanall
	python3 -m venv .
	bin/pip install -I -r requirements.txt
	./bin/buildout -c migration.cfg
	./bin/zodbupdate --convert-py3 --file=var/filestorage/Data.fs --encoding utf8 --encoding-fallback latin1
	bin/zodbverify
	# rsync -P ivar/filestorage/Data.fs imio@bibliotheca.imio.be:/srv/instances/sambreville/filestorage/Data.fs
	# rsync -r --info=progress2 var/blobstorage/ imio@bibliotheca.imio.be:/srv/instances/sambreville/blobstorage/
