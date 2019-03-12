#!/bin/bash

# Usage:
# ./mkgif.sh input.mkv output.gif

# helpful links:
# * https://www.ostechnix.com/create-animated-gif-ubuntu-16-04/

# the flags:
#  -ss : indicates the starting point of GIF
#  -i : input file
#  $1 : My video file name
#  -to : End position of the GIF file
#  -r : frame rate. You can increase the value to get more quality GIF file
#  -vf : filter graph. To scale the GIF image in the desired size.
#  -loop -1: don't loop the gif
#  $2 : output file


ffmpeg \
    -ss 00:00:00 \
    -i $1 \
    -r 3 \
    -vf scale=800:-1 \
    -loop -1 \
    $2
