#!/usr/bin/env bash

ffmpeg -i zoom_0.mp4 -i zoom_2.mp4 -filter_complex "[0:v] [0:a] [1:v] [1:a] concat=n=2:v=1:a=1 [v] [a]" -map "[v]" -map "[a]" output2.mp4
