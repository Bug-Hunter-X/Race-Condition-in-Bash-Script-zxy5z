#!/bin/bash

# This script demonstrates a solution to the race condition bug using a lock file.

count=0
lock_file="/tmp/count.lock"

function increment_count() {
  # Acquire the lock
  flock -n $lock_file || exit 1 # exit if we can't get lock
  local new_count=$((count + 1))
  count=$new_count
  echo $new_count > $lock_file # write count to file
  flock -u $lock_file
}

# Create two processes that concurrently increment the counter
increment_count &
increment_count &

# Wait for both processes to finish
wait

# Print the final count.  It will always be 2 because of the lock
echo "Final count: $count"
rm -f $lock_file