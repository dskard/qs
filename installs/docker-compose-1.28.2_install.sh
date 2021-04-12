#! /bin/bash

# https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-16-04

# show commands being run
set -x

# Fail script on error.
set -e

pkgname=docker-compose
VERSION=1.28.2
basedir=/opt
environdir=${basedir}/environ.d
profiledir=/etc/profile.d
pkginstalldir=${basedir}/${pkgname}
tarinstalldir=${pkginstalldir}/tars
installprefix=${pkginstalldir}/${VERSION}
downloaduri="https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-`uname -s`-`uname -m`"
script=$(readlink -f ${0})
installdir=$(dirname ${script})

if [[ ! -d ${installprefix} ]] ; then
    mkdir -p ${installprefix}
fi
cd ${installprefix}

if [[ ! -e ${pkgname} ]] ; then
    curl -L ${downloaduri} > ${pkgname}
    chmod +x ${pkgname}
fi

# setup use script

cat <<- _END_ > ${profiledir}/${pkgname}-${VERSION}.sh
export PATH=${installprefix}:\${PATH}
_END_
