# Autoware with zenoh bridge

The docker environment shows how to control two Autowares with zenoh-bridge-dds.

# Steps

* Set the version of Autoware and Zenoh

```shell
# Use Autoware galactic with zenoh 0.7.2
source env/env_galactic_0.7.2.sh
# Use Autoware galactic with zenoh 0.10.0
source env/env_galactic_0.10.0.sh
```

* Run containers in separated terminals

```shell
# 1st container
./run_autoware.sh
# 2nd container
./run_autoware.sh
# 3rd container
./run_teleop.sh
```

* 1st container: Run Autoware

```shell
# Use tmux

# Run Autoware
./autoware.sh
# Run bridge with namespace "v1"
../zenoh-plugin-ros2dds/target/release/zenoh-bridge-ros2dds -c myconfig.json5 --ros-localhost-only -n /v1
```

* 2nd container: Run Autoware

```shell
# Use tmux

# Run Autoware
./autoware.sh
# Run bridge with scope "v2"
../zenoh-plugin-ros2dds/target/release/zenoh-bridge-ros2dds -c myconfig.json5 --ros-localhost-only -n /v2
```

* 3rd container: Run autoware_manual_control

```shell
# Run manual controller
./target/release/autoware_manual_control -p "*" -m ros2
```

* Clean environment

```shell
./clean.sh
```

