#!/bin/bash

ip link set lo multicast on
source /opt/autoware/setup.bash

parallel --verbose --lb ::: \
    "ROS_LOCALHOST_ONLY=1 ros2 launch autoware_launch planning_simulator.launch.xml map_path:=$HOME/autoware_map/sample-map-planning vehicle_model:=sample_vehicle sensor_model:=sample_sensor_kit launch_system_monitor:=true launch_deprecated_api:=true" \
    "zenoh-bridge-ros2dds -c myconfig.json5 --no-multicast-scouting --ros-localhost-only -n /${VEHICLE_NAME} -e ${FMS_CONNECTION}"

