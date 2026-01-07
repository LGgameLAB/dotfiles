#!/bin/sh

if lsmod | grep -q uvcvideo; then
    sudo modprobe -r uvcvideo
    echo "Webcam disabled"
else
    sudo modprobe uvcvideo
    echo "Webcam enabled"
fi

