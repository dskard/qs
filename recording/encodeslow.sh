#! /bin/sh
#
# ./encodeslow.sh input.mp4 output.mp4

# we need the '-strict -2' or '-strict -experimental'
# to account for the experimental acc encoder inside ffmpeg

ffmpeg -i ${1} -c:v libx264 -qp 0 -preset veryslow -acodec copy ${2}
