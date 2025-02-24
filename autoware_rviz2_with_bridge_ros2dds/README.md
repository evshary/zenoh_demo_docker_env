# Bridge Autoware and rviz2 with zenoh-bridge-ros2dds

The tutorial shows how to bridge Autoware and rviz2 cross Internet with the help of zenoh-bridge-ros2dds.

## Architecture

![Architecture](Architecture.drawio.svg)

## Demo video

[![Demo video](https://img.youtube.com/vi/2uKWHR6OhBA/maxresdefault.jpg)](https://youtu.be/2uKWHR6OhBA)

## Tutorial

* (Host 1) Run the Autoware and zenoh-bridge-ros2dds

```shell
# Assign the other side IP
export VISUALIZE_IP=192.168.x.y
# Run Autoware
docker compose -f ./docker-compose-autoware.yml up
```

* (Host 2) Run rviz2 and another zenoh-bridge-ros2dds

```shell
xhost +local:
docker compose -f ./docker-compose-rviz.yml up
```

* It might need some time to initialize depending on the network quality
