export ROS_VERSION=humble
export ZENOH_VERSION=0.10.0

export DOCKER_IMAGE=autoware-${ROS_VERSION}-with-bridge-ros2dds-${ZENOH_VERSION}
export DOCKER_FILE=docker/Dockerfile_${ROS_VERSION}_${ZENOH_VERSION}
