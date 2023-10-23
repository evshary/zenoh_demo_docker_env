#!/bin/bash

xhost +
docker run --rm -it --privileged \
    --env "ROS_LOCALHOST_ONLY=1" -v $PWD/runtime:/root/runtime \
    -v /tmp/.X11-unix:/tmp/.X11-unix --env="QT_X11_NO_MITSHM=1" --env "DISPLAY=$DISPLAY" \
    ${DOCKER_IMAGE} bash

