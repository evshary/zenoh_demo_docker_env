#!/bin/bash

xhost +
docker run --rm -it --env "ROS_LOCALHOST_ONLY=1" -v /tmp/.X11-unix:/tmp/.X11-unix --env="QT_X11_NO_MITSHM=1" --env "DISPLAY=$DISPLAY" galactic-bridge bash

