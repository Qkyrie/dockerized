#!/bin/bash
set -e
SRCDIR="/owapi"
CONFIGDIR="/owapi-config"

service redis-server start

if [ "$(ls -A $SRCDIR)" ]; then
     echo "$SRCDIR is not empty, not going to clone "
else
    echo "$SRCDIR is empty, going to start new"
    cd $SRCDIR && git clone https://github.com/Cinderpup/OWAPI .
fi

cd $SRCDIR 

if [ ! -f $SRCDIR/installed ]; then
    python3 -m venv $SRCDIR/venv
    chmod +x $SRCDIR/venv/bin/activate
    source ./venv/bin/activate  && pip3 install -r requirements.txt && mv $CONFIGDIR/config.yml $SRCDIR/config.yml
    touch $SRCDIR/installed
fi

export LC_ALL=C.UTF-8
export LANG=C.UTF-8

service redis-server start
PYTHONPATH=. asphalt run config.yml
tail -f /dev/null