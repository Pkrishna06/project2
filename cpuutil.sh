#!/bin/bash
THRESHOLD=50      
LOG_FILE="/var/log/cpu_monitor.log"
EMAIL="your-email@example.com"
SUBJECT="High CPU Usage Alert"
MESSAGE="CPU usage has exceeded the defined threshold of ${THRESHOLD}%."
check_cpu_usage() {
USAGE=$(top -b -n1 | awk '/^%Cpu/{printf "%.0f", $2}')
echo "$(date) - CPU Usage: ${USAGE}%" >> $LOG_FILE
if (( USAGE > THRESHOLD )); then
echo "$MESSAGE Current usage: ${USAGE}%" | mail -s "$SUBJECT" $EMAIL
fi
}
