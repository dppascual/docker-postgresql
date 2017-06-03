#!/bin/bash
#
# Summary: Inicialize PostgreSQL dockerized 
# Author: Daniel Peña <dppascual@gmail.com>
# Version: 1.0
#
set -eo pipeline

[[ $DEBUG == true ]] && set -x

# Check if there are arguments to be passed to postgres
if [[ ${1:0:1} == "-" ]]; then
    EXTRA_ARGS="$@"
    set --
fi

#
# Set up replication in the future automatically
#
echo "Starting PostgreSQL ${PG_VERSION{}..."
exec ${PG_BINDIR}/postgres -D ${PG_DATADIR} $EXTRA_ARGS
