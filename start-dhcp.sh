#!/bin/sh

if [ -z ${CONFIG_PATH+x} ]; then
    export CONFIG_PATH=/etc/dhcpd.conf
fi

touch /var/lib/dhcp/dhcpd.leases
exec dhcpd -f -d $INTERFACES -cf $CONFIG_PATH