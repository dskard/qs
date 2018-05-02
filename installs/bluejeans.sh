#! /bin/bash

set -x

VER_SHORT="1.34"
VER_LONG="1.34.28"
BLUEJEANS_RPM="bluejeans-${VER_LONG}.x86_64.rpm"
BLUEJEANS_DEB="bluejeans_${VER_LONG}-2_amd64.deb"

BLUEJEANS_URL="https://swdl.bluejeans.com/desktop/linux/${VER_SHORT}/${VER_LONG}/${BLUEJEANS_RPM}"

curl -o ${BLUEJEANS_RPM} -L ${BLUEJEANS_URL};

apt install alien

alien ${BLUEJEANS_RPM}

gdebi --non-interactive ${BLUEJEANS_DEB}

# also may need libudev.so.0
# on debian, we have /lib/x86_64-linux-gnu/libudev.so.1
# provided by libudev1 package. it should already be installed
# probably just need to symlink to it.

ln -s /lib/x86_64-linux-gnu/libudev.so.1 /opt/bluejeans/libudev.so.0

# bluejeans is installed into /opt/bluejeans
# start with `bash /opt/bluejeans/bluejeans`
