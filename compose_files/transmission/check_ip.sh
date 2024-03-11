#!/bin/bash
# To check which IP address your VPN is currently connected to, run this script:

f_container_name()
{
docker ps --format "{{.Names}}"| grep -i transmission
}

f_find_all()
{
curl --silent ipinfo.io/$ext_ip
}

var_cont_name=$(f_container_name)
ext_ip=$(docker exec $var_cont_name curl --silent "http://ipinfo.io/ip")
echo "Transmission VPN currently connected to IP address: $ext_ip"
echo "This IP address is in the following country: "
f_find_all
