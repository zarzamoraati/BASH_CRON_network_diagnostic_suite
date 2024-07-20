#!/bin/bash

# Description: Connectivity check

# Variables

HOST='google.com'
LOGFILE=./ping_check.log

if [[ ! -f "$LOGFILE" ]];then
	

# Create Log Dir if not exists 
	echo "Creating log directory..."
	
	set -x
	mkdir -p $(dirname "$LOGFILE")
	set +x
	touch "$LOGFILE"
fi

# PING the host

echo "[$(date)] Pining "$HOST"" >> "$LOGFILE" 2>&1

ping -c 4 "$HOST" >> "$LOGFILE" 2>&1


#echo "something" >> ~/networking/basic_networking/ping_check_log.log 2>&1

