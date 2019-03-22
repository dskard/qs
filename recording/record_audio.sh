#! /bin/sh

# audio only
# avconv -f alsa -i pulse -threads 4 $1.mp3
ffmpeg -f pulse -i default $1.wav
