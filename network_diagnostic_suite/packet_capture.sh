#!/bin/bash

# Description: Analyse the incoming packets in an Interface Network and log that activity

## Variables

INTERFACE=enp6s0
DURATION=10
LOGFILE=./packet_capture.pcap

## Create the file and DIR

#set -x
if [[ ! -f "$LOGFILE" ]]; then

	echo "Creating log file..."
	
	mkdir -p $(dirname "$LOGFILE")
	touch "$LOGFILE"

fi

## Capture packets


echo "[$(date)] Capturing packets on interface: $INTERFACE for $DURATION seconds"
> "$LOGFILE"

sudo tcpdump -i "$INTERFACE" -w "$LOGFILE" -G "$DURATION" -W 1 > "$LOGFILE" 2>&1


#set +x


