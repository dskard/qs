#! /bin/sh

# pick and record a window
#
# USAGE:
# record_window.sh myfilename
#
# recording will start after you choose a window.

# take a look at:
# https://unix.stackexchange.com/a/14170

# getting window borders
# http://unix.stackexchange.com/a/156349
entire=false
x=0
y=0
w=0
h=0
b=0  # b for border
t=0  # t for title (or top)

eval $(xwininfo  |
      sed -n -e "s/^ \+Absolute upper-left X: \+\([0-9]\+\).*/x=\1/p" \
             -e "s/^ \+Absolute upper-left Y: \+\([0-9]\+\).*/y=\1/p" \
             -e "s/^ \+Width: \+\([0-9]\+\).*/w=\1/p" \
             -e "s/^ \+Height: \+\([0-9]\+\).*/h=\1/p" )
if [ "$entire" = true ]
then
    extents=$(xprop _NET_FRAME_EXTENTS -id "$aw" | grep "NET_FRAME_EXTENTS" | cut -d '=' -f 2 | tr -d ' ')
    bl=$(echo $extents | cut -d ',' -f 1) # width of left border
    br=$(echo $extents | cut -d ',' -f 2) # width of right border
    t=$(echo $extents | cut -d ',' -f 3)  # height of title bar
    bb=$(echo $extents | cut -d ',' -f 4) # height of bottom border

    let x=$x-$bl
    let y=$y-$t
    let w=$w+$bl+$br
    let h=$h+$t+$bb
fi

echo recording "$w"x"$h" $x,$y

if [ `expr ${w} % 2` -eq 1 ]; then
    w=`expr $w + 1`;
    echo "setting width: $w"
fi

if [ `expr ${h} % 2` -eq 1 ]; then
    h=`expr $h + 1`;
    echo "setting height: $h"
fi

# could probably use ffmpeg here just the same
# https://trac.ffmpeg.org/wiki/Capture/Desktop
# more on encoding
# https://trac.ffmpeg.org/wiki/Encode/H.264
# https://trac.ffmpeg.org/wiki/Encode/MPEG-4

ffmpeg \
    -f alsa \
    -i pulse \
    -f x11grab \
    -r 25 \
    -s ${w}x${h} \
    -i :0.0+${x},${y} \
    -vcodec libx264 \
    -preset ultrafast \
    -crf 0 \
    -threads 4 \
    ${1}.mkv


