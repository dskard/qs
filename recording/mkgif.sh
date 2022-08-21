#!/bin/bash

# Usage:
# ./mkgif.sh input.mkv output.gif

# helpful links:
# * https://www.ostechnix.com/create-animated-gif-ubuntu-16-04/
# * https://superuser.com/a/556031 (better quality, smaller size, custom palette)
# * https://engineering.giphy.com/how-to-make-gifs-with-ffmpeg/ (better explanation, 1-line command for it all)

# the flags:
#  -ss : indicates the starting point of GIF
#  -i : input file
#  $1 : My video file name
#  -to : End position of the GIF file
#  -r : frame rate. You can increase the value to get more quality GIF file
#  -vf : filter graph. To scale the GIF image in the desired size.
#  -loop -1: don't loop the gif
#  $2 : output file


# generate the custom palette
ffmpeg \
    -y \
    -ss 00:00:00 \
    -i $1 \
    -vf fps=10,scale=1280:-1:flags=lanczos,palettegen \
    palette.png

# output the gif using the palette
ffmpeg \
    -ss 00:00:00 \
    -i $1 \
    -i palette.png \
    -loop -1 \
    -filter_complex "fps=30,scale=1280:-1:flags=lanczos[x];[x][1:v]paletteuse" \
    $2

rm palette.png
