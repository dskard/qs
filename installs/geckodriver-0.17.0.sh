#! /bin/bash

# show commands being run
set -x

# Fail script on error.
set -e

pkgname=geckodriver
VERSION=0.17.0
basedir=/opt
environdir=${basedir}/environ.d
profiledir=/etc/profile.d
pkginstalldir=${basedir}/${pkgname}
tarinstalldir=${pkginstalldir}/tars
installprefix=${pkginstalldir}/${VERSION}
tarfilebase=geckodriver-v${VERSION}-linux64
tarfilename=${tarfilebase}.tar.gz
downloaduri=https://github.com/mozilla/geckodriver/releases/download/v${VERSION}/${tarfilename}
script=$(readlink -f ${0})
installdir=$(dirname ${script})

if [[ ! -d ${pkginstalldir}/tars ]] ; then
    mkdir -p ${pkginstalldir}/tars
fi
cd ${pkginstalldir}/tars

if [[ ! -e ${tarfilename} ]] ; then
    curl -O -L ${downloaduri}
fi
tar xvzf ${tarfilename}

install -D --mode 0755 ${pkgname} ${installprefix}/bin/${pkgname}


# setup use script
#if [[ ! -d ${environdir} ]] ; then
#    mkdir -p ${environdir}
#fi

cat <<- _END_ > ${profiledir}/${pkgname}-${VERSION}.sh
export PATH=${installprefix}/bin:\$PATH
_END_

