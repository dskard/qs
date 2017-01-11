#!/bin/bash

# linuxbrew lives here
# http://linuxbrew.sh/

# show commands being run
set -x

# Fail script on error.
set -e

pkgname=linuxbrew
basedir=/opt
profiledir=/etc/profile.d
pkginstalldir=${basedir}/${pkgname}
installprefix=${pkginstalldir}

cd ${basedir}
git clone https://github.com/Linuxbrew/brew.git ${pkginstalldir}


cat <<- _END_ > ${profiledir}/${pkgname}.sh
export PATH=${installprefix}/bin:\$PATH
export MANPATH=${installprefix}/share/man:\$MANPATH
export INFOPATH=${installprefix}/share/info:\$INFOPATH
_END_


. ${profiledir}/${pkgname}.sh

# add repositories
# homebrew/science provides r, rstudio-server
brew tap homebrew/science
brew tap linuxbrew/xorg

# install common codes
brew install cmake
brew install boost
brew install r
brew install rstudio-server
brew install python
#brew install libffi


