# isc-dhcp-sever
Dockerized ISC DHCP server v. 4.3.4

Just edit the volume paths and `INTERFACES` variable to fit your needs. 

## Docker Run
```
docker run \
  --name=isc-dhcp \
  --net=host \
  -v /path/to/dhcpd.conf:/etc/dhcpd.conf \
  -v dhcp-data:/var/lib/dhcp \
  -e "INTERFACES=ens192 ens256" \
  -d kerwood/isc-dhcp
```

## Build your own
```
$ git clone https://github.com/Kerwood/isc-dhcp-sever.git
$ cd isc-dhcp-sever
$ docker build -t your-container-name .
```

```
docker run \
  --name=isc-dhcp \
  --net=host \
  -v /path/to/dhcpd.conf:/etc/dhcpd.conf \
  -v dhcp-data:/var/lib/dhcp \
  -e "INTERFACES=ens192 ens256" \
  -d your-container-name 
```
## Docker Compose
```
version: '3'

services:
  dhcp:
    image: kerwood/isc-dhcp
    container_name: isc-dhcp
    restart: unless-stopped
    network_mode: "host"
    environment:
      - "INTERFACES=ens192 ens256"
    volumes:
      - /path/to/dhcpd.conf:/etc/dhcpd.conf
      - dhcp-data:/var/lib/dhcp
```

## Configuration example - dhcpd.conf
```
# Show that we want to be the only DHCP server in this network:
authoritative;

default-lease-time 600;
max-lease-time 7200;

# Use Google public DNS server (or use faster values that your internet provider gave you!):
option domain-name-servers 8.8.8.8, 8.8.4.4;
option domain-name "example.org";


subnet 192.168.1.0 netmask 255.255.255.0 {
    range 192.168.1.2 192.168.1.253;
    option subnet-mask 255.255.255.0;
    option broadcast-address 192.168.1.255;
    option routers 192.168.1.1;
}
```