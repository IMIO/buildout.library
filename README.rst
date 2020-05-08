Buildout Library
================
This buildout is used to build dev and production environment for imio iA.Bibliohteca app.

dev
---

```
    make buildout
    ./bin/instance fg

```

prod
----

Production is build via Jenkins. A docker image is build in each commit and pushed on staging.
To run locally a production service, you can use docker-compose

First

Add imio user to your environment::

    sudo addgroup --gid 209 imio
    sudo usermod -a -G imio $USERNAME
    sudo chmod 664 -R var/filestorage/*
    sudo chown $USERNAME:imio -R var/filestorage

Second get eggs to build quickly and build image::

    make eggs
    docker-compose build

Finally start docker-compose::

    docker-compose up

and you can go to http://portal.localhost now
