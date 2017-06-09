#!/bin/bash
#
# Summary: Inicialize PostgreSQL dockerized
# Author: Daniel Peña <dppascual@gmail.com>
# Version: 9.6-0.2
#
set -eo pipefail

source ${PG_APP_HOME}/functions

[[ $DEBUG == true ]] && set -x

# Check if there are arguments to be passed to postgres
if [[ ${1:0:1} == "-" ]]; then
    EXTRA_ARGS="$@"
    set --
fi

#
# Set up replication in the future automatically
#
echo "Starting set up"
configure_postgresql

echo "Starting PostgreSQL ${PG_VERSION}..."
exec sudo -HEu ${PG_USER} -i ${PG_BINDIR}/postgres -D ${PG_HOME} $EXTRA_ARGS
