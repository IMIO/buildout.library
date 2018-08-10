FROM docker-staging.imio.be/library/cache:latest
RUN buildDeps="libpq-dev wget git python-virtualenv gcc libc6-dev libpcre3-dev libssl-dev libxml2-dev libxslt1-dev libbz2-dev libffi-dev libjpeg62-dev libopenjp2-7-dev zlib1g-dev python-dev" \
  && runDeps="poppler-utils wv rsync lynx netcat libxml2 libxslt1.1 libjpeg62 libtiff5 libopenjp2-7" \
  && apt-get update \
  && apt-get install -y --no-install-recommends $buildDeps
RUN apt-get install -y gosu
RUN mkdir /home/imio/plone
COPY docker-entrypoint.sh /
COPY Makefile *.cfg *.txt /home/imio/plone/
RUN chown imio:imio -R /home/imio/plone/ && chown imio:imio /docker-entrypoint.sh && chmod +x /docker-entrypoint.sh
WORKDIR /home/imio/plone
ENV PATH="/home/imio/.local/bin:${PATH}"
RUN pip install -I -r requirements.txt
USER imio
RUN ln -fs prod.cfg buildout.cfg \
  && buildout
USER root
RUN apt-get remove -y $buildDeps \
  && apt-get install -y $runDeps \
  && apt-get autoremove -y \
  && apt-get clean
ENV ZEO_HOST db
ENV ZEO_PORT 8100
ENV HOSTNAME_HOST local
ENV PROJECT_ID bibliotheca
EXPOSE 8080
HEALTHCHECK --start-period=30s --timeout=10s --interval=1m \
  CMD curl --fail http://127.0.0.1:8080/ || exit 1`
ENTRYPOINT ["/docker-entrypoint.sh"]
