#!/usr/bin/env bash

set -euxo pipefail

# setup the package repo
# https://docs.makedeb.org/prebuilt-mpr/getting-started/#setting-up-the-repository
wget -qO - 'https://proget.makedeb.org/debian-feeds/prebuilt-mpr.pub' | gpg --dearmor | sudo tee /usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg 1> /dev/null
echo "deb [arch=all,$(dpkg --print-architecture) signed-by=/usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg] https://proget.makedeb.org prebuilt-mpr $(lsb_release -cs)" | sudo tee /etc/apt/sources.list.d/prebuilt-mpr.list
sudo apt update

# https://github.com/casey/just?tab=readme-ov-file#packages
sudo apt install just fzf
