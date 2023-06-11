#!/bin/bash

# Usage:
# ./mkwebm.sh input.mkv output.webm

# helpful links:
# * https://stackoverflow.com/a/6983249

# the flags:
#  -i : input file
#  $1 : My video file name
#  -q:v : video quality? ranging from 0 (low) to 10 (high)
#  -c:v : video codec - libvpx is webm
#  -c:a : audio codec - libvorbis
#  -crf : range 4-63, lower value means higher quality
#         set to 10 originally, produced larger files, so
#         changed to 40, quality looks good enough.
#         file size was about the same as the gif
#  -b:v : not sure what this does
#  $2 : output file



ffmpeg \
    -i $1 \
    -q:v 10 \
    -c:v libvpx \
    -c:a libvorbis \
    -crf 40 \
    -b:v 1M \
    $2
