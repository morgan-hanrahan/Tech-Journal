#!/bin/bash
# Collaborated with Zach Morris, Alayna Cash, and Derek Farrell
hostfile=$1 
portfile=$2 
if [ -n "$1" ] && [ -n "$2" ]; then
       if [ ! -f $hostfile ] | [ ! -f $portfile ]; then 
       echo "One or both files weren't found."
	exit 1 
	fi 
	for host in $(cat $hostfile); do 
		for port in $(cat $portfile); do 
			timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null 
			if [ $? -eq 0 ]; then 
				echo "Port $port is OPEN on host $host" 
			else
				echo "Port $port is CLOSED on host $host"
			fi 
		done
	done
else 
	echo "Incorrect and/or Invalid Parameters."
fi
