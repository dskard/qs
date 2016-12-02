#!/bin/sh
#
# ./resizevideo.sh 0.75 input.mp4 output.mp4

ffmpeg -i ${2} -vf scale=iw*${1}:ih*${1} -acodec copy ${3}
