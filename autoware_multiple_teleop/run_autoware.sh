#!/bin/bash

DOCKER_IMAGE=autoware-${ROS_VERSION}-with-bridge-dds-${ZENOH_VERSION}
DOCKER_FILE=docker/Dockerfile_${ROS_VERSION}_${ZENOH_VERSION}

if [ ! "$(docker images -q ${DOCKER_IMAGE})" ]; then
    echo "${DOCKER_IMAGE} does not exist. Creating..."
    docker build -f ${DOCKER_FILE} -t ${DOCKER_IMAGE} .
fi

xhost +
docker run --rm -it --privileged \
           --env "ROS_LOCALHOST_ONLY=1" \
           -v $PWD/autoware.sh:/root/autoware.sh \
           -v $PWD/myconfig.json5:/root/myconfig.json5 \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           --env="QT_X11_NO_MITSHM=1" \
           --env "DISPLAY=$DISPLAY" \
           ${DOCKER_IMAGE} bash
