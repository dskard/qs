#!/usr/bin/env bash

# https://stackoverflow.com/a/57662502
echo "AddressFamily inet" >> /etc/ssh/sshd_config
service ssh restart
