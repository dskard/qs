#!/bin/bash

# ./audio_from_video.sh 7_compiled_languages.mkv 7_compiled_languages.mp3

ffmpeg -i $1 -q:a 0 -map a $2
