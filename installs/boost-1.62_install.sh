#! /bin/bash

# show commands being run
set -x

source /etc/profile.d/openssl-1.0.2l.sh

# Fail script on error.
set -e

pkgname=boost
version_major=1
version_minor=62
version_micro=0
version_dot=${version_major}.${version_minor}.${version_micro}
version_underbar=${version_major}_${version_minor}_${version_micro}
basedir=/opt
pkginstalldir=${basedir}/${pkgname}
tarinstalldir=${pkginstalldir}/tars
installprefix=${pkginstalldir}/${version_dot}
downloaduri=http://downloads.sourceforge.net/project/boost/boost/${version_dot}/boost_${version_underbar}.tar.gz
tarfilebase=boost_${version_underbar}
tarfilename=${tarfilebase}.tar.gz
environdir=/etc/profile.d
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
./bootstrap.sh --prefix=${installprefix}
./b2 install

if [[ ! -d ${environdir} ]] ; then
    mkdir ${environdir}
fi

cat <<- _END_ > ${environdir}/${pkgname}-${version_dot}
installprefix=${installprefix}

export LD_LIBRARY_PATH=\${installprefix}/lib:\${LD_LIBRARY_PATH}
export BOOST_INCLUDE=\${installprefix}/include
export BOOST_LIBS=-L\${installprefix}/lib
_END_
