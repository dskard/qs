#! /bin/bash

# show commands being run
set -x

# Fail script on error.
set -e

pkgname=nodejs
VERSION=10.15.3
basedir=/opt
environdir=${basedir}/environ.d
profiledir=/etc/profile.d
pkginstalldir=${basedir}/${pkgname}
tarinstalldir=${pkginstalldir}/tars
installprefix=${pkginstalldir}/${VERSION}
tarfilebase=node-v${VERSION}
tarfilename=${tarfilebase}.tar.gz
downloaduri=https://nodejs.org/dist/v${VERSION}/${tarfilename}
script=$(readlink -f ${0})
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
./configure --prefix=${installprefix}
make
make install

${installprefix}/bin/npm install -g express-generator@4

cat <<- _END_ > ${profiledir}/${pkgname}.sh
export PATH=${installprefix}/bin:\$PATH
_END_
