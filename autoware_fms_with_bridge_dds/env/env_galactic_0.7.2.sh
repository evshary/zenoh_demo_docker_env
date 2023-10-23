export ROS_VERSION=galactic
export ZENOH_VERSION=0.7.2

export DOCKER_IMAGE=autoware-${ROS_VERSION}-with-bridge-dds-${ZENOH_VERSION}
export DOCKER_FILE=docker/Dockerfile_${ROS_VERSION}_${ZENOH_VERSION}
