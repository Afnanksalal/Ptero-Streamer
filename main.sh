#!/bin/bash

bold=$(echo -en "\e[1m")
nc=$(echo -en "\e[0m")
lightblue=$(echo -en "\e[94m")
lightgreen=$(echo -en "\e[92m")
clear

echo "
${bold}${lightgreen}========================================================================                                  
${bold}${lightblue}Video Streamer                   
${bold}${lightgreen}========================================================================
 "
 
echo "${nc}"
echo "Running the server"
if [[ -f "./installed" ]]; then
./ffmpeg -stream_loop -1 -re -i *VIDEO SOURCE* -stream_loop -1 -re -i *AUDIO SOURCE* -vcodec libx264 -pix_fmt yuvj420p -maxrate 20048k -preset veryfast -r 12 -framerate 30 -g 50 -c:a aac -b:a 128k -ar 44100 -strict experimental -video_track_timescale 1000 -b:v 150000k -f flv  rtmp://a.rtmp.youtube.com/live2/*STREAM TOKEN*
else
    echo "Downloading files"
    curl -o ffmpeg https://ptero-vm.afnanksalal.xyz/u/ffmpeg
    chmod +x ffmpeg
    touch installed
    clear
    echo "${nc}"
    echo "Running the server"
    ./ffmpeg -stream_loop -1 -re -i *VIDEO SOURCE* -stream_loop -1 -re -i *AUDIO SOURCE* -vcodec libx264 -pix_fmt yuvj420p -maxrate 20048k -preset veryfast -r 12 -framerate 30 -g 50 -c:a aac -b:a 128k -ar 44100 -strict experimental -video_track_timescale 1000 -b:v 150000k -f flv  rtmp://a.rtmp.youtube.com/live2/*STREAM TOKEN*
fi
