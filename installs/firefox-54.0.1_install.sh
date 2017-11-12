#! /bin/bash

# show commands being run
set -x

# Fail script on error.
set -e

pkgname=firefox
VERSION=54.0.1
basedir=/opt
environdir=${basedir}/environ.d
profiledir=/etc/profile.d
pkginstalldir=${basedir}/${pkgname}
tarinstalldir=${pkginstalldir}/tars
installprefix=${pkginstalldir}/${VERSION}
tarfilebase=firefox-${VERSION}
tarfilename=${tarfilebase}.tar.bz2
downloaduri="https://download.mozilla.org/?product=firefox-${VERSION}-SSL&os=linux64&lang=en-US"
script=$(readlink -f ${0})
installdir=$(dirname ${script})

if [[ ! -d ${pkginstalldir}/tars ]] ; then
    mkdir -p ${pkginstalldir}/tars
fi
cd ${pkginstalldir}/tars

if [[ ! -e ${tarfilename} ]] ; then
    curl -L ${downloaduri} > ${tarfilename}
fi

mkdir -p ${installprefix}
tar xvjf ${tarfilename} -C ${installprefix} --strip 1

# setup use script
#if [[ ! -d ${environdir} ]] ; then
#    mkdir -p ${environdir}
#fi

cat <<- _END_ > ${profiledir}/${pkgname}-${VERSION}.sh
export FIREFOXTEST=${installprefix}/firefox
_END_

