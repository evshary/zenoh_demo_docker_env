# Autoware with zenoh bridge

The docker environment shows how to control two Autowares with zenoh-bridge-dds.

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

* 1st container: Run Autoware

```shell
# Use tmux

# Run Autoware
./autoware.sh
# Run bridge with scope "v1"
./zenoh-bridge-dds -c myconfig.json5 --dds-localhost-only -s "v1"
```

* 2nd container: Run Autoware

```shell
# Use tmux

# Run Autoware
./autoware.sh
# Run bridge with scope "v2"
./zenoh-bridge-dds -c myconfig.json5 --dds-localhost-only -s "v2"
```

* Control from outside

```shell
# Need RUST installed
git clone https://github.com/evshary/autoware_manual_control_rs.git
cd autoware_manual_control_rs
cargo build --release
# Run
./target/release/autoware_manual_control -s "*"
```

* Clean environment

```shell
./clean.sh
```

