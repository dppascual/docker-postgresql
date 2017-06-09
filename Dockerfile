#
# Dockerfile for creating PostgreSQL service
# Version: 1.0
#
FROM ubuntu:latest
MAINTAINER "Daniel Peña <dppascual@gmail.com>"

ENV PG_APP_HOME=/etc/docker-psql \
    PG_VERSION=9.6 \
    PG_USER=postgres \
    PG_RUNDIR=/var/run/postgresql \
    PG_LOGDIR=/var/log/postgresql

# It's necessary to separate environment variables when you want to use one of them over another
ENV PG_HOME=/etc/postgresql/${PG_VERSION}/main \
    PG_BINDIR=/usr/lib/postgresql/${PG_VERSION}/bin \
    PG_DATADIR=/var/lib/postgresql/${PG_VERSION}/main

RUN apt-get -qqy update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -qqy software-properties-common wget sudo \
 && add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ $(cat /etc/lsb-release | grep -i "codename" | awk -F "=" '{print $2}')-pgdg main" \
 && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
 && apt-get -qqy update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -qqy postgresql-${PG_VERSION} postgresql-contrib-${PG_VERSION} \
 && apt-get clean

EXPOSE 5432/tcp

ADD entrypoint.sh /sbin/entrypoint.sh
RUN chmod u+x /sbin/entrypoint.sh
ADD runtime/ ${PG_APP_HOME}/

ENTRYPOINT ["/sbin/entrypoint.sh"]
