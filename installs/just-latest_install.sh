#! /bin/bash

# show commands being run
set -x

# Fail script on error.
set -e

curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to /usr/local/bin/
