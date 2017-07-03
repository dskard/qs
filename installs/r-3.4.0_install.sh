#! /bin/bash

# this needs the following debian packages:
#   libpango1.0-dev
#   bzip2
#   libbz2-dev
#   liblzma-dev
#
# additional optional packages:
#   tcl-dev
#   tk-dev

# show commands being run
set -x

# Fail script on error.
set -e

pkgname=R
VERSION=3.4.0
basedir=/opt
environdir=${basedir}/environ.d
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
# TODO: figure out why check fails while testing complex numbers
#make check
make install

# setup Rprofile.site
install -D --mode 0444 ${installdir}/Rprofile.site.in ${installprefix}/lib/R/etc/Rprofile.site

# setup Rlogo-1.png
install -D --mode 0444 ${installdir}/Rlogo-1.png ${installprefix}/Rlogo-1.png


# setup use script
if [[ ! -d ${environdir} ]] ; then
    mkdir -p ${environdir}
fi

cat <<- _END_ > ${profiledir}/${pkgname}.sh
export PATH=${installprefix}/bin:\$PATH
export LD_LIBRARY_PATH=${installprefix}/lib/R/lib:\${LD_LIBRARY_PATH}
export MANPATH=${installprefix}/share/man:\${MANPATH}

export R_INSTALL_DIR=${installprefix}
export R_LOGO_PATH=${installprefix}/Rlogo-1.png
_END_

