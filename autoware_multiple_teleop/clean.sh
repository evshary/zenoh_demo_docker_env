#!/bin/bash

docker rmi autoware-${ROS_VERSION}-with-bridge-dds-${ZENOH_VERSION}
docker rmi teleop-with-${ZENOH_VERSION}

