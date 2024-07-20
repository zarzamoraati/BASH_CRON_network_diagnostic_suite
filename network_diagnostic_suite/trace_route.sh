#!/bin/bash 

# Description : trace route the packages sended to a host

## Variables

HOST=google.com
LOGFILE=./traceroute_log.log

## Create dir and files

if [[ ! -f "$LOGFILE" ]]; then
	echo "Creating log file"
	mkdir -p $(dirname "$LOGFILE")

	touch "$LOGFILE"

fi

echo "Tracing packets to $HOST"

echo "[ $(date) ] Tracing to $HOST"

traceroute "$HOST" >> "$LOGFILE" 2>&1

echo -e "Tracing finish" > "$LOGFILE"

echo "----------->" > "$LOGFILE"
