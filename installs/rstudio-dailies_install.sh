#! /usr/bin/env bash

set -x

i=$(curl -s https://dailies.rstudio.com/rstudio/latest/index.json | jq ".products.desktop.platforms.bionic")

link=$(echo $i | jq -r ".link")
filename=$(echo $i | jq -r ".filename")
sha256=$(echo $i | jq -r ".sha256")

# download the file, if needed
if [ ! -f ${filename} ] ; then
    curl -o ${filename} $link
fi

# check the file's checksum
echo "${sha256}  ${filename}" | sha256sum --strict -c

# install the package
gdebi -n ${filename}

