#!/bin/bash

# Usage:
# ./ffmpeg_trim.sh input.wmv 00:00:30.0 00:00:35.0 output.wmv
#
# helpful links:
# * https://stackoverflow.com/a/42827058
#   * see comments from theferrit32 Dec 16, 2018 at 20:18 about ordering of parameters
#
#
# a call like this:
#
#   ffmpeg_trim.sh input.wmv 00:00:30.0 00:00:35.0 output.wmv
#
# gets converted into:
#
#   ffmpeg -ss 00:00:30.0 -to 00:00:35.0 -i input.wmv output.wmv
#
# the flags:
#  -ss $2: start timestamp in hours:minutes:seconds
#  -to $3 : end timestamp in hours:minutes:seconds
#  -i $1 : input file
#  $4 : output file

ffmpeg \
    -ss $2 \
    -to $3 \
    -i $1 \
    $4
