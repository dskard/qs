#!/bin/bash


# www.putorius.net/2012/01/block-unwanted-advertisements-on.html
#url="http://winhelp2002.mvps.org/hosts.txt"
#out="hosts.txt"

# https://github.com/StevenBlack/hosts
url="https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
out="hosts"

wget -q ${url} -O /etc/hosts

cat <<- _END_ >> /etc/hosts
127.0.0.1       localhost
127.0.1.1       $(hostname).toybinlan.net  $(hostname)

# The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
ff02::3 ip6-allhosts
_END_

# flush dns cache
# /etc/rd.d/init.d/nscd restart
/etc/init.d/nscd restart

