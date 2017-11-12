#! /bin/bash

set -x

curl -o zoom_amd64.deb -L https://zoom.us/client/latest/zoom_amd64.deb;
gdebi --non-interactive zoom_amd64.deb

rm zoom_amd64.deb
