#! /bin/bash

# this needs the following ubuntu packages installed:
# libpixman-1-dev
# libfdt-dev
# 

# show commands being run
set -x

# Fail script on error.
set -e

pkgname=qemu-gae
VERSION=2.8.0-20161227
basedir=/opt
environdir=${basedir}/environ.d
profiledir=/etc/profile.d
pkginstalldir=${basedir}/${pkgname}
tarinstalldir=${pkginstalldir}/tars
installprefix=${pkginstalldir}/${VERSION}
tarfilebase=qemu-gae-${VERSION}
tarfilename=gae-${VERSION}.tar.gz
downloaduri=https://github.com/gnuarmeclipse/qemu/archive/${tarfilename}
script=$(readlink -f ${0}
installdir=$(dirname ${script})

if [[ ! -d ${pkginstalldir}/tars ]] ; then
    mkdir -p ${pkginstalldir}/tars
fi
cd ${pkginstalldir}/tars

if [[ ! -e ${tarfilename} ]] ; then
    wget ${downloaduri}
fi
tar xvzf ${tarfilename}
cd ${tarfilebase}
mkdir -p build
cd build
../configure --prefix=${installprefix}
make
# FAILS HERE

if [[ ! -d ${environdir} ]] ; then
    mkdir -p ${environdir}
fi

cat <<- _END_ > ${profiledir}/${pkgname}.sh
export PATH=${installprefix}/bin:\$PATH
_END_
