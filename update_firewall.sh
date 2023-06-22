#!/usr/bin/env bash

# helpfule links
# 1. https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu-20-04

# print out old rules
ufw status numbered

# clear out old rules
ufw reset

# deny all incomming, allow all outgoing
ufw default deny incoming
ufw default allow outgoing

# allow ssh incoming
ufw allow ssh

# start the firewall
ufw enable
