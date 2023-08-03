#!/bin/bash

FILE=./yt-dlp_linux
if test -f "$FILE"; then
    echo "$FILE exists."
else
	wget https://github.com/ytdl-patched/yt-dlp/releases/download/2023.02.17.334/yt-dlp_linux
	chmod +x $FILE
	sudo apt install ffmpeg
fi


$FILE --extract-audio --audio-format mp3 --audio-quality 0 -o $2"/%(playlist)s/%(title)s.%(ext)s" $1
