#!/bin/bash
# Collaborated with Zach Morris, Alayna Cash, Matt Bobbitt, and Derek Farrell
ip_prefix=$1 
port=$2  
	for host in $(seq 0 254); do
		timeout .1 bash -c "echo >/dev/tcp/$ip_prefix.$host/$port" 2> /dev/null 
		if [ $? -eq 0 ];
		then
			echo "Port $port is OPEN on host $ip_prefix.$host" > dns-servers.txt
		else
			echo "Port $port is CLOSED on host $ip_prefix.$host" > closed-servers.txt
		fi 
	done
	cat dns-servers.txt
