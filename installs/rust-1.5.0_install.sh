#!/bin/bash

# rust script download script lives here:
# https://www.rust-lang.org/downloads.html

# show commands being run
set -x

# Fail script on error.
set -e

pkgname=rust
VERSION=1.5.0
basedir=/opt
environdir=${basedir}/environ.d
pkginstalldir=${basedir}/${pkgname}
tarinstalldir=${pkginstalldir}/tars
installprefix=${pkginstalldir}/${VERSION}
rust_install_script=rustup.sh
downloaduri=https://static.rust-lang.org/${rust_install_script}
#script=$(readlink -f ${0})
#installdir=$(dirname ${script})

if [[ ! -d ${pkginstalldir}/tars ]] ; then
    mkdir -p ${pkginstalldir}/tars
fi
cd ${pkginstalldir}/tars

if [[ ! -e ${rust_install_script} ]] ; then
    # curl -f -L http://static.rust-lang.org/rustup.sh -O
    curl -sSf ${downloaduri} -O
fi

rm -rf ${installprefix}

sh ${rust_install_script} --prefix=${installprefix} --disable-sudo -y

if [[ ! -d ${environdir} ]] ; then
    mkdir -p ${environdir}
fi

cat <<- _END_ > ${environdir}/${pkgname}-${VERSION}
conflict RUST_CHOICE

desc "Rust programming language."

help "https://www.rust-lang.org"

version=${VERSION}
location=${pkginstalldir}/\${version}

prepend PATH \${location}/bin

tags MATHSCI
_END_

