#!/bin/bash

# This script demonstrates a race condition bug.

count=0

function increment_count() {
  local new_count=$((count + 1))
  count=$new_count
}

# Create two processes that concurrently increment the counter
increment_count & 
increment_count &

# Wait for both processes to finish
wait

# Print the final count.  It will often be less than 2 because of the race.
echo "Final count: $count"