#!/bin/bash

# Description: Check the status of a given PORT

# Variables


NETWORK="$1"
PORT="$2"
LOGFILE=./port_scanning.log

# Check args exist

set -x
if [[ ! $# -eq 2 ]]; then
	echo "Error, you need to provide PORT and IP Address.."

fi 
set +x	

#Log Dir

if [[ ! -f "$LOGFILE" ]]; then
	echo "Creating File..."
	mkdir -p $(dirname "$LOGFILE")
	touch "$LOGFILE"

fi

echo "[$(date)] Scanning network $NETWORK" > "$LOGFILE"

nmap -sT -p "$PORT" -oG "$LOGFILE" "$NETWORK"  

echo -e "Finish Scanning ----->" > "$LOGFILE"
