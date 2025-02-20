# Bridge Autoware and rviz2 with zenoh-bridge-ros2dds

The tutorial shows how to bridge Autoware and rviz2 cross Internet with the help of zenoh-bridge-ros2dds.

## Architecture

![Architecture](Architecture.drawio.svg)

## Demo video

[![Demo video](https://img.youtube.com/vi/2uKWHR6OhBA/maxresdefault.jpg)](https://youtu.be/2uKWHR6OhBA)

## Tutorial

* (Host 1) Run the zenoh-bridge-ros2dds

```shell
./zenoh-bridge-ros2dds -d 2 -l tcp/0.0.0.0:8888 --queries-timeout-default 120.0
```

* (Host 2) Run another zenoh-bridge-ros2dds

```shell
./zenoh-bridge-ros2dds -d 1 -e tcp/<Host 1 IP>:8888 --queries-timeout-default 120.0
```

* (Host 2) Run Autoware without rviz2

```shell
ROS_DOMAIN_ID=1 ros2 launch autoware_launch planning_simulator.launch.xml map_path:=$HOME/autoware_map/sample-map-planning vehicle_model:=sample_vehicle sensor_model:=sample_sensor_kit rviz:=false
```

* (Host 1) Run rviz2
  * Note that it might take some time depends on the connection quality.

```shell
ROS_DOMAIN_ID=2 rviz2 -d /opt/autoware/share/autoware_launch/rviz/autoware.rviz
```
