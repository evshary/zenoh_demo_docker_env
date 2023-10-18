#!/bin/bash

docker rmi autoware-${ROS_VERSION}-with-bridge-ros2dds-${ZENOH_VERSION}
docker rmi teleop-with-${ZENOH_VERSION}

