# ROS 2 galactic with zenoh bridge

The docker environment shows how to connect talker & listener in different containers with zenoh-bridge-dds.

# Steps

* Installation

```shell
./build.sh
```

* Run two containers in separated terminals

```shell
# 1st container
./run.sh
# 2nd container
./run.sh
```

* 1st container

```shell
# Use tmux
ROS_LOCALHOST_ONLY=1 ros2 run demo_nodes_cpp talker
./zenoh-bridge-dds --dds-localhost-only
```

* 2nd container

```shell
# Use tmux
ROS_LOCALHOST_ONLY=1 ros2 run demo_nodes_cpp listener
./zenoh-bridge-dds --dds-localhost-only
```

* Clean environment

```shell
./clean.sh
```

