#!/usr/bin/env bash

if [[ ! -f /root/.radiant/radiant.conf ]]; then
echo -e "Creating config file..."
mkdir /root/.radiant > /dev/null 2>&1
touch /root/.radiant/radiant.conf
cat <<- EOF > /root/.radiant/radiant.conf
rpcuser=${rpcuser}
rpcpassword=${rpcpassword}
listen=1
daemon=1
server=1
rest=1
dbcache=10
txindex=1
rpcworkqueue=1024
rpcthreads=64
rpcallowip=0.0.0.0/0
EOF
fi

# listen=1
# daemon=1
# server=1
# rest=1
# dbcache=10
# txindex=1
# rpcworkqueue=32
# rpcthreads=16
# rpcallowip=0.0.0.0/0
# rpcbind=127.0.0.1
# rpcbind=radiant-node
# rpcbind=radiant-node
# rpcallowip=0.0.0.0/0
# rpcbind=127.0.0.1
# rpcbind=radiant-node

bash -c "radiantd -datadir=/root/.radiant && python3 /root/electrumx/electrumx_server"