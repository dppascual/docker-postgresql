#
# Dockerfile for creating PostgreSQL service
# Version: 1.0
#
FROM ubuntu:latest
MAINTAINER "Daniel Peña <dppascual@gmail.com>"

ENV PG_VERSION=9.6 \
    PG_USER=postgres \
    PG_HOME=/var/lib/postgresql \
    PG_DATADIR=${PG_HOME}/${PG_VERSION}/main \
    PG_RUNDIR=/run/postgresql \
    PG_BINDIR=/usr/lib/postgresql/${PG_VERSION}/bin \
    PG_LOGDIR=/var/log/postgresql

RUN sudo add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" \
 && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - \
 && apt-get -qqy update \
 && apt-get install -qqy postgresql-{PG_VERSION} postgresql-contrib-{PG-VERSION} \
 && apt-get clean

EXPOSE 5432/tcp

ADD entrypoint.sh /sbin/entrypoint.sh
RUN chmod u+x /sbin/entrypoint.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]
