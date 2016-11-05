#! /bin/bash

# show commands being run
set -x

# Fail script on error.
set -e

pkgname=googletest
VERSION=1.8.0
basedir=/opt
environdir=${basedir}/environ.d
profiledir=/etc/profile.d
pkginstalldir=${basedir}/${pkgname}
tarinstalldir=${pkginstalldir}/tars
installprefix=${pkginstalldir}/${VERSION}
tarfilebase=release-${VERSION}
tarfilename=${tarfilebase}.tar.gz
untarbase=googletest-release-${VERSION}
downloaduri=https://github.com/google/googletest/archive/${tarfilename}
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

if [[ -d ${installprefix} ]] ; then
    rm -rf ${installprefix}
fi
mkdir -p ${installprefix}/include
mkdir -p ${installprefix}/lib

# run cmake to configure
# build googletest and googlemock
cd ${untarbase}
cmake -DBUILD_SHARED_LIBS=ON .
make

# install headers and shared libs
cp -a googletest/include/gtest ${installprefix}/include
cp -a googlemock/include/gmock ${installprefix}/include
cp -a googlemock/gtest/*.so ${installprefix}/lib
cp -a googlemock/*.so ${installprefix}/lib


if [[ ! -d ${environdir} ]] ; then
    mkdir -p ${environdir}
fi


cat <<- _END_ > ${profiledir}/${pkgname}.sh
export LD_LIBRARY_PATH=${installprefix}/lib:\$LD_LIBRARY_PATH
export GOOGLETEST_PATH=${installprefix}
export CPATH=${installprefix}/include:\$CPATH
_END_
