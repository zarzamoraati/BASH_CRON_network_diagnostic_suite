#!/bin/bash


# Check the status of the network send simple request to google and redirect the output to a file to register the status


## Variables

HOST=google.com
LOGFILE=./ping_check2.log

## Create the file if not exist already

#set -x 
if [[ ! -f "$LOGFILE" ]]; then
	echo "Creating log file"

	mkdir -p $(dirname "$LOGFILE") # It would return the name of teh parent directory to teh mkdir command to create it
	touch "$LOGFILE"
fi
#set +x

## Send the request

echo -e "[ $(date) ] Pining to $HOST..." > $LOGFILE

ping -c 4 "$HOST" > "$LOGFILE" 2>&1

echo "Pining Test Finish. This is the report:"
echo -e $(cat "$LOGFILE")


