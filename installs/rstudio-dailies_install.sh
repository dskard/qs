#! /bin/bash

set -x 

wget https://s3.amazonaws.com/rstudio-ide-build/desktop/xenial/amd64/rstudio-1.2.1242-amd64.deb -O rstudio-ide.deb

gdebi -n rstudio-ide.deb

