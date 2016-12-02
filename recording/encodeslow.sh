#! /bin/sh
ffmpeg -i ${1} -c:v libx264 -qp 0 -preset veryslow ${2}
