#! /bin/bash

# show commands being run
set -x

# Fail script on error.
set -e

# install R packages

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

# cran_repos list is a single-quoted, comma separated list
cran_repos="\
    'http://cran.rstudio.com/', \
    'http://cran.wustl.edu/', \
    'http://cran.revolutionanalytics.com/' \
"

R -e "install.packages(c(${cran_packages}), repos=c(${cran_repos}))";


# install bioconductor and packages
# bioclite_packages list is a single-quoted, comma separated list
bioclite_packages="\
    'hopach', \
    'OmicCircos', \
    'GEOquery', \
    'affy', \
    'limma', \
    'mouse4302cdf', \
    'mouse4302.db' \
"

# install bioconductor and packages
R -e "source('http://bioconductor.org/biocLite.R'); biocLite(ask=FALSE); biocLite(c(${bioclite_packages}),ask=FALSE)"
