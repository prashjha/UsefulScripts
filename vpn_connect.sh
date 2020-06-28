#!/bin/bash

# path to find vpn executible
VPN_DIR="/opt/cisco/anyconnect/bin/vpn" 
# vpn hostname
HOST_NAME="vpn.utexas.edu" 

##
## Run script 
## ./vpn_connect.sh <flag>
## flag = 0 - to connect
##        1 - to disconnect
##        2 - check status
##
## vpn_cred.txt should have user id and password. Third line of file
## has "push" to work with Duo push
##

connect="0"
if [[ $# -gt 0 ]]; then
	connect="$1"
fi

if [[ $connect == "0" ]]; then
	$VPN_DIR -s < vpn_cred.txt connect $HOST_NAME
elif [[ $connect == "1" ]]; then
	$VPN_DIR disconnect
else
	$VPN_DIR status
fi

