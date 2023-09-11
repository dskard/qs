#!/usr/bin/env bash

# https://github.com/StevenBlack/hosts
#url="https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
url="https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts"

wget -q ${url} -O /etc/hosts

cat <<- _END_ >> /etc/hosts

# additional custom
0.0.0.0 videos-fms.jwpsrv.com
0.0.0.0 videos-cloudflare.jwpsrv.com
0.0.0.0 assets-jpcust.jwpsrv.com
0.0.0.0 cdn.jwplayer.com
_END_

# restart networking
#service network-manager restart
systemctl restart NetworkManager.service

# flush dns cache
# /etc/rd.d/init.d/nscd restart
#/etc/init.d/nscd restart
#service nscd restart
systemctl restart nscd

