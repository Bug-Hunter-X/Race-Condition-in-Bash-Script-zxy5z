# Race Condition in Bash Script

This repository demonstrates a simple race condition bug in a Bash script.  Two processes attempt to increment a shared counter simultaneously, resulting in an unpredictable final count, often less than the expected value of 2.

The `bug.sh` file contains the buggy script. The `bugSolution.sh` file provides a solution using a mutex or other synchronization method to prevent the race condition.

## Running the Scripts

1. Clone the repository.
2. Run `./bug.sh`. Observe that the final count is frequently less than 2.
3. Run `./bugSolution.sh`. Observe that the final count is consistently 2.

This example highlights the importance of proper synchronization when multiple processes or threads access and modify shared resources.