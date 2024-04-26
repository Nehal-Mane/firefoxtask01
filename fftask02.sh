#!/bin/bash

# Specify the directory to monitor for logs
log_dir="/var/log"

# Specify the output file for logs
output_file="/var/log/all_logs.txt"

# Start inotifywait in a loop
while true; do
  # Wait for changes in the log directory
  new_log=$(inotifywait -e create $log_dir/*.log)

  # Check if a new log file was created
  if [[ ! -z "$new_log" ]]; then
    # Extract filename from the path
    log_file=$(basename "$new_log")
    echo "New log file detected: $log_file"

    # Append contents of the new log file to the output file
    cat "$log_dir/$log_file" >> "$output_file"

    echo "New log content appended to $output_file"
  fi
done
