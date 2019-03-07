#! /bin/bash

set -x 

# docker-ce is installed from docker.com repo
#   see https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
# for ubuntu 17.10, you need to use test channel
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker-ce.list
apt-get update
apt-cache policy docker-ce
apt-get install -y docker-ce

# install syntax highlighting for docker in vim
apt-get install -y \
    vim-syntax-docker \


# setup docker to run without sudo by adding the user to the "docker" group
# run this to add the user:
#   sudo usermod -aG docker <username>

