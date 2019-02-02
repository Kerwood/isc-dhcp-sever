#!/bin/sh

touch /var/lib/dhcp/dhcpd.leases
exec dhcpd -f -d $INTERFACES