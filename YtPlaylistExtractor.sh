#!/bin/bash

FILE=./yt-dlp_linux
if test -f "$FILE"; then
    echo "$FILE exists."
else
	wget https://github.com/ytdl-patched/yt-dlp/releases/download/2023.02.17.334/yt-dlp_linux
	chmod +x $FILE
fi
if ! [ -x "$(command -v ffmpeg)" ]; then
	sudo apt install ffmpeg
fi

$FILE --extract-audio --audio-format flac --audio-quality 0 -o $2"/%(playlist)s/%(title)s.%(ext)s" $1
