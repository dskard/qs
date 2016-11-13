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

#    Shiny
cran_packages="\
    'MCMCpack', \
    'mvtnorm', \
    'Biobase', \
    'EbayesThresh', \
    'Hmisc', \
    'VGAM', \
    'cluster', \
    'glmnet', \
    'gpls', \
    'igraph', \
    'integrOmics', \
    'mixOmics', \
    'pamr', \
    'pls', \
    'pvclust', \
    'rgl', \
    'spls', \
    'xcms', \
    'pwr', \
    'dcemriS4', \
    'oro.nifti', \
    'oro.dicom', \
    'agRee', \
    'Agreement', \
    'ggplot2', \
    'googleVis', \
    'gooJSON', \
    'R.matlab', \
    'XML', \
    'RCurl', \
    'Survival', \
    'deSolve', \
    'rootSolve', \
    'minpack.lm', \
    'MASS', \
    'coda', \
    'lattice', \
    'FME', \
    'mnormt', \
    'waterData', \
    'EcoHydRology', \
    'hydroTSM', \
    'foreign', \
    'reshape', \
    'gdata', \
    'spdep', \
    'spgrass6', \
    'ncdf4', \
    'plyr', \
    'maptools', \
    'gridExtra', \
    'corrplot', \
    'systemfit', \
    'plm', \
    'countrycode', \
    'stargazer', \
    'msm', \
    'rgeos', \
    'classInt', \
    'shiny', \
    'shinydashboard', \
    'colorspace', \
    'Cairo', \
    'maxlike', \
    'rgdal', \
    'gdalUtils', \
    'AUC', \
    'pander', \
    'orginal', \
    'dplyr', \
    'rmarkdown', \
    'optparse', \
    'maps', \
    'ggmap', \
    'hexbin', \
    'RColorBrewer', \
    'ordinal', \
    'pheatmap', \
    'proto', \
    'ucminf', \
    'sqldf', \
    'methods', \
    'DT' \
"

# methods package is not available in 3.2.3

# might need to install libpng12-dev for ggmap package

#source /etc/environ.sh
#use -e -r ${pkgname}-${VERSION}

# cran_repos list is a single-quoted, comma separated list
cran_repos="\
    'http://cran.rstudio.com/', \
    'http://cran.wustl.edu/', \
    'http://cran.revolutionanalytics.com/' \
"

${installprefix}/bin/R -e "install.packages(c(${cran_packages}), repos=c(${cran_repos}))";

#${installdir}/r_hopach_installer.tcl ${VERSION}


# install bioconductor and packages
# bioclite_packages list is a single-quoted, comma separated list
bioclite_packages="\
    'OmicCircos', \
    'GEOquery', \
    'affy', \
    'limma', \
    'mouse4302cdf', \
    'mouse4302.db' \

"

# install bioconductor and packages
${installprefix}/bin/R -e "source('http://bioconductor.org/biocLite.R'); biocLite(ask=FALSE); biocLite(c(${bioclite_packages}),ask=FALSE)"
