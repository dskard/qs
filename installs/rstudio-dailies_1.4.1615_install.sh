#! /bin/bash

VERSION=1.4.1615

set -x

wget  https://s3.amazonaws.com/rstudio-ide-build/desktop/bionic/amd64/rstudio-${VERSION}-amd64.deb -O rstudio-${VERSION}-amd64.deb

gdebi -n rstudio-${VERSION}-amd64.deb

