#!/bin/bash

# anaconda script download script lives here:
# http://continuum.io/downloads

# show commands being run
set -x

# Fail script on error.
set -e

pkgname=anaconda3
VERSION=5.0.1
PY_VERSION=3
basedir=/opt
environdir=${basedir}/environ.d
profiledir=/etc/profile.d
pkginstalldir=${basedir}/${pkgname}
tarinstalldir=${pkginstalldir}/tars
installprefix=${pkginstalldir}/${VERSION}
anaconda_install_script=Anaconda${PY_VERSION}-${VERSION}-Linux-x86_64.sh
downloaduri=https://repo.continuum.io/archive/${anaconda_install_script}
script=$(readlink -f ${0})
installdir=$(dirname ${script})

if [[ ! -d ${pkginstalldir}/tars ]] ; then
    mkdir -p ${pkginstalldir}/tars
fi
cd ${pkginstalldir}/tars

if [[ ! -e ${anaconda_install_script} ]] ; then
    wget ${downloaduri}
fi

rm -rf ${installprefix}

bash ${anaconda_install_script} -p ${installprefix} -b -f

if [[ ! -d ${environdir} ]] ; then
    mkdir -p ${environdir}
fi


cat <<- _END_ > ${profiledir}/${pkgname}.sh
export PATH=${installprefix}/bin:\$PATH
_END_


# we want the very latest versions of these
${installprefix}/bin/conda update --yes conda
${installprefix}/bin/conda update --yes anaconda
${installprefix}/bin/conda update --yes ipython \
#                                        ipython-notebook \
#                                        ipython-qtconsole

# also install these
${installprefix}/bin/conda install --yes pymc
${installprefix}/bin/conda install --yes mathjax
${installprefix}/bin/conda install --yes seaborn
${installprefix}/bin/conda install --yes jupyter

# also install R kernel and common R packages
${installprefix}/bin/conda install --yes -c http://conda.anaconda.org/r r-essentials

# install with pip
${installprefix}/bin/pip install GPy
${installprefix}/bin/pip install common
${installprefix}/bin/pip install pyttk
${installprefix}/bin/pip install pyqrcode
${installprefix}/bin/pip install folium

# for ideas on how to install non-conda packages using conda install,
# check out www.peterbronez.com/Using%20PyPi%20Packages%20with%20Conda

