#!/bin/bash 

for ip in $(seq 2 50); 
do 
	if nmap -n -vv -sn "10.0.5.$ip" | grep -q "Host is up"; then 
		echo "10.0.5.$ip" >> sweep3.txt
	else
		continue 
	fi
done
