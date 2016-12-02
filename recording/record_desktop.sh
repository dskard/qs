#! /bin/sh

#avconv -f x11grab -r 25 -s 1440x900 -i :0.0+0,0 -vcodec libx264 -pre lossless_ultrafast -threads 0 $1.mkv

# can't use lossless_ultrafast with audio or we get a 6 second delay between audio and video
avconv -f alsa -i pulse -f x11grab -r 25 -s 1440x900 -i :0.0+0,0 -vcodec libx264 -pre:0 ultrafast -threads 4 $1.mkv
