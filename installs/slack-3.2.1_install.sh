#! /bin/bash

# show commands being run
set -x

# Fail script on error.
set -e

appname=slack-desktop
VERSION=3.2.1
pkgname="${appname}-${VERSION}-amd64.deb"
downloaduri="https://downloads.slack-edge.com/linux_releases/${pkgname}"

curl -o ${pkgname} -L ${downloaduri}
gdebi -n ${pkgname}
rm ${pkgname}

