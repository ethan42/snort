#!/bin/bash

# Detect the bridge network interface (it usually starts with "br-")

set -euxo pipefail

#BRIDGE_INTERFACE=$(ip link | grep -o 'eth0-[^ :]*')
BRIDGE_INTERFACE=${BRIDGE_INTERFACE:-ens5}

iptables -I INPUT -p tcp --dport 80 -j NFQUEUE --queue-num 0
iptables -I OUTPUT -p tcp --sport 80 -j NFQUEUE --queue-num 0

echo $BRIDGE_INTERFACE
# Start Snort on the detected interface
stdbuf -i0 -o0 -e0 snort -Q -A console -q -c /etc/snort/snort.conf --daq nfq --daq-var queue=0 --daq-mode inline

