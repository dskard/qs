#!/bin/bash

# Usage:
# ./ffmpeg_trim.sh input.wmv 00:00:30.0 00:00:10.0 output.wmv
#
# helpful links:
# * https://superuser.com/a/141343
#
#
# a call like this:
#
#   ffmpeg_trim.sh input.wmv 00:00:30.0 00:00:10.0 output.wmv
#
# gets converted into:
#
#   ffmpeg -ss 00:00:30.0 -i input.wmv -c copy -t 00:00:10.0 output.wmv
#
# the flags:
#  -ss $2: start timestamp in hours:minutes:seconds
#  -i $1 : input file
#  -c copy : make a copy of the video
#  -t $3 : length of the video to copy in hours:minutes:seconds
#  $4 : output file

ffmpeg \
    -ss $2 \
    -i $1 \
    -c copy \
    -t $3 \
    $4
