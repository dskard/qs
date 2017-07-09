#! /bin/bash

# geckodriver for firefox & selenium interaction

# show commands being run
set -x

# Fail script on error.
set -e


pkgname=geckodriver
VERSION=0.17.0
basedir=/opt
profiledir=/etc/profile.d
pkginstalldir=${basedir}/${pkgname}-compiled
tarinstalldir=${pkginstalldir}/tars
installprefix=${pkginstalldir}/${VERSION}
tarfilebase=${pkgname}
tarfilename=${pkgname}-v${VERSION}-linux64.tar.gz
downloaduri=https://github.com/mozilla/geckodriver/releases/download/v${VERSION}/${tarfilename}
environdir=${basedir}/environ.d
script=$(readlink -f ${0})
installdir=$(dirname ${script})

if [[ ! -d ${pkginstalldir}/tars ]] ; then
    mkdir -p ${pkginstalldir}/tars
fi
cd ${pkginstalldir}/tars

if [[ ! -e ${tarfilename} ]] ; then
    curl -L ${downloaduri} > ${tarfilename}
fi
tar xvzf ${tarfilename}
install --mode 0755 -D ${tarfilebase} ${installprefix}/bin/${tarfilebase}


if [[ ! -d ${environdir} ]] ; then
    mkdir ${environdir}
fi

cat <<- _END_ > ${profiledir}/${pkgname}-${VERSION}.sh
export PATH=${installprefix}/bin:\$PATH
_END_
