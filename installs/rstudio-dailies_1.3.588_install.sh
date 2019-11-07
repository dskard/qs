#! /bin/bash

set -x

wget  https://s3.amazonaws.com/rstudio-ide-build/desktop/bionic/amd64/rstudio-1.3.588-amd64.deb -O rstudio-ide.deb

gdebi -n rstudio-ide.deb

