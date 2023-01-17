# ROS 2 galactic with zenoh bridge

The docker environment shows how to connect ROS nodes in different containers with zenoh-bridge-dds.

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

* 1st container: Run ROS node

```shell
# Use tmux

# Option1: talker
ROS_LOCALHOST_ONLY=1 ros2 run demo_nodes_cpp talker

# Option2: turtlesim
ROS_LOCALHOST_ONLY=1 ros2 run turtlesim turtlesim_node
```

* 2nd container: RUn ROS node

```shell
# Use tmux

# Option1: listener
ROS_LOCALHOST_ONLY=1 ros2 run demo_nodes_cpp listener

# Option2: turtlesim keyboard 
ROS_LOCALHOST_ONLY=1 ros2 run turtlesim turtle_teleop_key
```

* These two ROS nodes can't connect, so we need zenoh-bridge-dds.

```shell
# Run bridge in two containers
./zenoh-bridge-dds --dds-localhost-only
```

* Clean environment

```shell
./clean.sh
```

