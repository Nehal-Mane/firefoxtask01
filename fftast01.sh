#!/bin/bash

# Launch 3 instances of Firefox
for i in {1..3}; do
  firefox &
done

# Get PIDs of running Firefox processes (using pgrep for broader matching)
firefox_pids=$(pgrep -f firefox)

# Split PIDs into an array
pids=($firefox_pids)

# Close each Firefox process by PID
for pid in "${pids[@]}"; do
  echo "Killing Firefox with PID: $pid"
  kill $pid
done

echo "All Firefox instances closed!"
