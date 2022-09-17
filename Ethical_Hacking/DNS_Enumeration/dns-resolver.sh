#!/bin/bash

ip_prefix=$1 
server=$2

for host in $(seq 0 254); do 
	nslookup $1.$host $2 | grep "name"
done 

