#! /bin/bash

# ./record_projector my_recording_name 1024x768

if [[ "x$2" == "x" ]] ; then
    res="1440x900"
else
    res=$2
fi

ffmpeg -f alsa -i pulse -f x11grab -r 25 -s $res -i :0.0+1440,0 -vcodec libx264 -pre:0 ultrafast -threads 4 $1.mkv
