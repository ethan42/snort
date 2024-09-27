#!/bin/bash

# Detect the bridge network interface (it usually starts with "br-")

set -euxo pipefail

#BRIDGE_INTERFACE=$(ip link | grep -o 'eth0-[^ :]*')
BRIDGE_INTERFACE=${BRIDGE_INTERFACE:-eth0}

echo $BRIDGE_INTERFACE
# Start Snort on the detected interface
snort -A console -q -c /etc/snort/snort.conf -i $BRIDGE_INTERFACE

