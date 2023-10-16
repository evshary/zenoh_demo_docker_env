#!/bin/bash

xhost +
# TODO: Don't use CycloneDDS here, since CycloneDDS with localhost can't work with bridge
# "RMW_IMPLEMENTATION=rmw_cyclonedds_cpp"
docker run --rm -it \
            --env "ROS_LOCALHOST_ONLY=1" \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            --env="QT_X11_NO_MITSHM=1" \
            --env "DISPLAY=$DISPLAY" \
            humble-bridge-ros2dds bash

