#!/bin/bash

DOCKER_IMAGE=teleop-with-${ZENOH_VERSION}
DOCKER_FILE=docker/Dockerfile_${ZENOH_VERSION}

if [ ! "$(docker images -q ${DOCKER_IMAGE})" ]; then
    echo "${DOCKER_IMAGE} does not exist. Creating..."
    docker build -f ${DOCKER_FILE} -t ${DOCKER_IMAGE} .
fi

xhost +
docker run --rm -it --privileged \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           --env="QT_X11_NO_MITSHM=1" \
           --env "DISPLAY=$DISPLAY" \
           ${DOCKER_IMAGE} bash
