#! /bin/bash

# openssl 1.0.x is needed by rstudio-server
# they have not moved to openssl 1.1.x

# show commands being run
set -x

# Fail script on error.
set -e


pkgname=openssl
VERSION=1.0.2l
basedir=/opt
profiledir=/etc/profile.d
pkginstalldir=${basedir}/${pkgname}
tarinstalldir=${pkginstalldir}/tars
installprefix=${pkginstalldir}/${VERSION}
downloaduri=https://www.openssl.org/source/openssl-${VERSION}.tar.gz
tarfilebase=${pkgname}-${VERSION}
tarfilename=${pkgname}-${VERSION}.tar.gz
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

cd ${tarfilebase}

set +e
make clean
set -e
./config --prefix=${installprefix} shared zlib
make
make test
make install

if [[ ! -d ${environdir} ]] ; then
    mkdir ${environdir}
fi

cat <<- _END_ > ${profiledir}/${pkgname}-${VERSION}.sh
export PATH=${installprefix}/bin:\$PATH
export LD_LIBRARY_PATH=${installprefix}/lib:\$LD_LIBRARY_PATH
export OPENSSL_HOME=${installprefix}
_END_

chmod 600 ${profiledir}/${pkgname}-${VERSION}.sh
