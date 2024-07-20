#!/bin/bash


### Description: Combine all the logs reports in the suite to generate a report

##Variables

set -x

REPORTFILE=/home/polo/networking/basic_networking/$(echo report_$(date +'%Y%m%d%H%M').log)

echo "$REPORTFILE" >> /home/polo/networking/basic_networking/generate_report.log
# Save the name of each log file as an array variable

LOG_FILES=($(ls '/home/polo/networking/basic_networking/network_diagnostic_suite'| grep ".log$"))

#CREATE REPORT



echo "[$(date)]  Generating Network Diagnostic Report" >> "$REPORTFILE"

# 


# Save the names as an array of elements 

# Ensure report File exist

if [[ ! -f "$REPORTFILE" ]]; then
	echo "Creating Report File ..."
	mkdir -p $(dirname "$REPORTFILE")
	echo "$REPORTFILE"
fi


# Copy the content of each file to the report file

echo -e "Staring New Report..." > "$REPORTFILE"

for file in "${LOG_FILES[@]}";do
       # Append the content of each file to the REPORT	
	echo -e "REPORT SECTION  ----> [$file]" >> "$REPORTFILE"
	cat "/home/polo/networking/basic_networking/network_diagnostic_suite/$file" >> "$REPORTFILE"
		
done 

set +x 
echo "---------------- FINISH REPORTING ------------"



# Schedule the execution of each script in the suite to generate new report every DAY


