#!/usr/bin/env bash

# Add repo
echo "deb http://download.opensuse.org/repositories/network:/messaging:/zeromq:/release-stable/xUbuntu_16.04/ ./" >> /etc/apt/sources.list.d/zeromq.list

# Add the key
wget https://download.opensuse.org/repositories/network:/messaging:/zeromq:/release-stable/xUbuntu_16.04/Release.key -O- | sudo apt-key add

# install
apt update
apt install libzmq3-dev
