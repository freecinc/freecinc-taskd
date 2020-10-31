#! /bin/bash

if [ -z "$TASKDDATA" ]; then
    echo "TASKDDATA not set"
    exit 1
fi

if [ -z "$SECRETS_DIR" ]; then
    echo "SECRETS_DIR not set"
    exit 1
fi

# set up the taskddir.  This is safe to do on every startup, and is
# basically what `taskd init` does

mkdir -p $TASKDDATA/orgs
cat <<EOF >$TASKDDATA/config
confirmation=1
extensions=/usr/libexec/taskd
ip.log=on
log=/dev/stdout
pid.file=/run/taskd.pid
queue.size=10
request.limit=0
root=$TASKDDATA
server=0.0.0.0:53589
trust=strict
verbose=1
client.cert=$SECRETS_DIR/client.cert.pem
client.key=$SECRETS_DIR/client.key.pem
server.cert=$SECRETS_DIR/server.cert.pem
server.key=$SECRETS_DIR/server.key.pem
server.crl=$SECRETS_DIR/server.crl.pem
ca.cert=$SECRETS_DIR/ca.cert.pem
EOF

# start up taskd
exec taskd server
