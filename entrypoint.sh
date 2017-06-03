#!/bin/bash
#
# Summary: Inicialize PostgreSQL dockerized 
# Author: Daniel Peña <dppascual@gmail.com>
# Version: 1.0
#
set -eo pipefail

[[ $DEBUG == true ]] && set -x

# Check if there are arguments to be passed to postgres
if [[ ${1:0:1} == "-" ]]; then
    EXTRA_ARGS="$@"
    set --
fi

inicialize() {
    # Adjust PostgreSQL configuration so that remote connections to the
    # database are possible.
    echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/${PG_VERSION}/main/pg_hba.conf

    # And add ``listen_addresses`` to ``/etc/postgresql/9.3/main/postgresql.conf``
    echo "listen_addresses='*'" >> /etc/postgresql/${PG_VERSION}/main/postgresql.conf
}

#
# Set up replication in the future automatically
#
echo "Starting set up"
inicialize

echo "Starting PostgreSQL ${PG_VERSION}..."
exec su - ${PG_USER} -c "${PG_BINDIR}/postgres -D ${PG_HOME} $EXTRA_ARGS"
