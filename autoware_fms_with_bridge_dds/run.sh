#!/bin/bash

xhost +
docker run --rm -it --privileged \
    --env "ROS_LOCALHOST_ONLY=1" -v $PWD/runtime:/root/runtime \
    -v /tmp/.X11-unix:/tmp/.X11-unix --env="QT_X11_NO_MITSHM=1" --env "DISPLAY=$DISPLAY" \
    -e VEHICLE_NAME=v1 -e FMS_CONNECTION=tcp/127.0.0.1:7887 \
    ${DOCKER_IMAGE} bash

