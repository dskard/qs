#! /bin/bash

#avconv -f x11grab -r 25 -s 1440x900 -i :0.0+0,0 -vcodec libx264 -pre lossless_ultrafast -threads 0 $1.mkv

# can't use lossless_ultrafast with audio or we get a 6 second delay between audio and video

# ./record_projector my_recording_name 1024x768

if [[ "x$2" == "x" ]] ; then
    res="1440x900"
else
    res=$2
fi

avconv -f alsa -i pulse -f x11grab -r 25 -s $res -i :0.0+1440,0 -vcodec libx264 -pre:0 ultrafast -threads 4 $1.mkv
