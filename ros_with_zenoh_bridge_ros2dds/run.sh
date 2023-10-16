#!/bin/bash

DOCKER_IMAGE=${ROS_VERSION}-with-bridge-ros2dds-${ZENOH_VERSION}
DOCKER_FILE=docker/Dockerfile_${ROS_VERSION}_${ZENOH_VERSION}

if [ ! "$(docker images -q ${DOCKER_IMAGE})" ]; then
    echo "${DOCKER_IMAGE} does not exist. Creating..."
    docker build -f ${DOCKER_FILE} -t ${DOCKER_IMAGE} .
fi

xhost +
# TODO: Don't use CycloneDDS here, since CycloneDDS with localhost can't work with bridge
# "RMW_IMPLEMENTATION=rmw_cyclonedds_cpp"
docker run --rm -it \
           --env "ROS_LOCALHOST_ONLY=1" \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           --env="QT_X11_NO_MITSHM=1" \
           --env "DISPLAY=$DISPLAY" \
           ${DOCKER_IMAGE} bash
