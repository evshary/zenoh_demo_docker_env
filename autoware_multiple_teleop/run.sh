#!/bin/bash

xhost +
sudo ip link set lo multicast on
docker run --rm -it --privileged \
    --env "LIBGL_ALWAYS_SOFTWARE=1" --env "ROS_LOCALHOST_ONLY=1" -v $PWD/autoware.sh:/root/autoware.sh \
    -v $PWD/myconfig.json5:/root/myconfig.json5 \
    -v /tmp/.X11-unix:/tmp/.X11-unix --env="QT_X11_NO_MITSHM=1" --env "DISPLAY=$DISPLAY" \
    autoware-bridge bash

