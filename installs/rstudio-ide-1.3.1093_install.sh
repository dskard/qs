#! /bin/bash

set -x

IDE_VERSION=1.3.1093
INSTALL_DIR=/opt/rstudio-ide/${IDE_VERSION}
TAR_FILENAME=rstudio-${IDE_VERSION}-amd64-debian.tar.gz
DOWNLOAD_URL=https://download1.rstudio.org/desktop/xenial/amd64/${TAR_FILENAME}

mkdir -p ${INSTALL_DIR}
cd ${INSTALL_DIR}

wget ${DOWNLOAD_URL}

tar xvzf ${TAR_FILENAME} -C ${INSTALL_DIR} --strip 1
