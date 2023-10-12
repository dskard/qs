#!/bin/bash

# Usage:
# ./ffmpeg_slow.sh input.mp4 8.0 output.mp4
#
# lower number means slower speed, 2 or 4 is usually good
#
# helpful links:
#   * https://trac.ffmpeg.org/wiki/How%20to%20speed%20up%20/%20slow%20down%20a%20video
#
#
# a call like this:
#
#   ffmpeg_slow.sh input.mp4 8.0 output.mp4
#
# gets converted into:
#
#   ffmpeg -i input.mp4 -filter:v "setpts=8.0*PTS" output.mp4
#
# the flags:
#  -i $1 : input file
#  -filter:v "setpts==$2*PTS" : slowdown or speed up
#  $3 : output file

#ffmpeg \
#    -i $1 \
#    -filter:v "setpts=$2*PTS" \
#    $3

# Usage:
# ./ffmpeg_slow.sh input.mp4 1 output.mp4
#
# where 1 is the framerate, 1 frame per second
#
# helpful links:
#   * https://trac.ffmpeg.org/wiki/How%20to%20speed%20up%20/%20slow%20down%20a%20video
#

ffmpeg -i $1 -map 0:v -c:v copy -bsf:v h264_mp4toannexb $1.h264
ffmpeg -fflags +genpts -r $2 -i $1.h264 -c:v copy $3
rm $1.h264
