#! /bin/bash

# show commands being run
set -x

# Fail script on error.
set -e

curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -

echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | tee -a /etc/apt/sources.list.d/signal-xenial.list

apt update && apt install signal-desktop
