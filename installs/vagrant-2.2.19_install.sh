#! /bin/bash

# show commands being run
set -x

# Fail script on error.
set -e

pkgname=vagrant
VERSION=2.2.19
pkgname="vagrant_${VERSION}_x86_64.deb"
downloaduri="https://releases.hashicorp.com/vagrant/${VERSION}/${pkgname}"
script=$(readlink -f ${0})
installdir=$(dirname ${script})

curl -o ${pkgname} -L ${downloaduri}
gdebi -n ${pkgname}
rm ${pkgname}

