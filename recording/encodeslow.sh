#! /bin/sh
#
# ./encodeslow.sh input.mp4 output.mp4

ffmpeg -i ${1} -c:v libx264 -qp 0 -preset veryslow ${2}
