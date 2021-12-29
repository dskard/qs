#! /bin/bash

# https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-on-linux

# show commands being run
set -x

# Fail script on error.
set -e

apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y kubectl
