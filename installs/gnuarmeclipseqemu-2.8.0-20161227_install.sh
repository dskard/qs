#! /bin/bash

# show commands being run
set -x

# Fail script on error.
set -e

pkgname=gnuarmeclipse-qemu
VERSION=2.8.0-201612271623
version_major=2
version_minor=8
version_micro=0
version_year=2016
version_month=12
version_day=27
version_hour=16
version_min=23
version1=${version_major}.${version_minor}.${version_micro}-${version_year}${version_month}${version_day}
version2=${version1}${version_hour}${version_min}
basedir=/opt
environdir=${basedir}/environ.d
profiledir=/etc/profile.d
pkginstalldir=${basedir}/${pkgname}
tarinstalldir=${pkginstalldir}/tars
installprefix=${pkginstalldir}/${version1}
tarfilebase=${pkgname}-debian64-${version2}-dev
tarfilename=${tarfilebase}.tgz
downloaduri=https://github.com/gnuarmeclipse/qemu/releases/download/gae-${version1}/${tarfilename}
script=$(readlink -f ${0})
installdir=$(dirname ${script})

if [[ ! -d ${pkginstalldir}/tars ]] ; then
    mkdir -p ${pkginstalldir}/tars
fi
cd ${pkginstalldir}/tars

if [[ ! -e ${tarfilename} ]] ; then
    wget ${downloaduri}
fi

rm -rf ${installprefix}
mkdir -p ${installprefix}
tar -C ${installprefix} -xvzf ${tarfilename} --strip 2


if [[ ! -d ${environdir} ]] ; then
    mkdir -p ${environdir}
fi


cat <<- _END_ > ${profiledir}/${pkgname}.sh
export PATH=${installprefix}/bin:\$PATH
_END_
