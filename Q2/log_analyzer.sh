#!/bin/bash

# Check if exactly one argument is provided
if [ $# -ne 1 ]; then
    echo "Error: Please provide exactly one log file."
    exit 1
fi

# Check if file exists and is readable
if [ ! -f "$1" ] || [ ! -r "$1" ]; then
    echo "Error: File does not exist or is not readable."
    exit 1
fi

logfile="$1"

total=$(wc -l < "$logfile")
info_count=$(grep -c " INFO " "$logfile")
warning_count=$(grep -c " WARNING " "$logfile")
error_count=$(grep -c " ERROR " "$logfile")

recent_error=$(grep " ERROR " "$logfile" | tail -n 1)

date_today=$(date +%Y-%m-%d)
report="logsummary_$date_today.txt"

echo "Log Summary Report" > "$report"
echo "Total Entries: $total" >> "$report"
echo "INFO Messages: $info_count" >> "$report"
echo "WARNING Messages: $warning_count" >> "$report"
echo "ERROR Messages: $error_count" >> "$report"
echo "Most Recent ERROR:" >> "$report"
echo "$recent_error" >> "$report"

cat "$report"

