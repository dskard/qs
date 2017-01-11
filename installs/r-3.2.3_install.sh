#! /bin/bash

# this needs the following ubuntu packages installed:
# openjdk-7-jdk for jni.h
# libpango1.0-dev for png/cairo stuff

# show commands being run
set -x

# Fail script on error.
set -e

pkgname=R
VERSION=3.2.3
basedir=/opt
environdir=${basedir}/environ.d
profiledir=/etc/profile.d
pkginstalldir=${basedir}/${pkgname}
tarinstalldir=${pkginstalldir}/tars
installprefix=${pkginstalldir}/${VERSION}
tarfilebase=R-${VERSION}
tarfilename=${tarfilebase}.tar.gz
downloaduri=https://cran.r-project.org/src/base/R-3/${tarfilename}
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
./configure --enable-R-shlib \
            --prefix=${installprefix} \
            --with-tcltk \
            --with-cairo
make clean
make all
make check
make install

if [[ ! -d ${environdir} ]] ; then
    mkdir -p ${environdir}
fi


cat <<- _END_ > ${profiledir}/${pkgname}.sh
export PATH=${installprefix}/bin:\$PATH
_END_


# install R packages

. ${profiledir}/${pkgname}.sh
${installdir}/r-packages-${VERSION}_install.sh
