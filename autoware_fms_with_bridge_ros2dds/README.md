# Multiple Autoware with FMS

The script setups several Autoware with zenoh-bridge-ros2dds for FMS test environment.

## Steps

* Install [docker compose](https://docs.docker.com/compose/install/linux/#install-using-the-repository) and [just](https://github.com/casey/just?tab=readme-ov-file#installation)

* Build docker images

```shell
just build
```

* Run [the FMS environment](https://github.com/evshary/zenoh_autoware_fms)

### Run manually

* Go inside the docker container and the first Autoware

```shell
just run
VEHICLE_NAME=v1 FMS_CONNECTION=tcp/172.17.0.1:7887 ./autoware.sh
```

* Create another container and run the second one

```shell
just run
VEHICLE_NAME=v2 FMS_CONNECTION=tcp/172.17.0.1:7887 ./autoware.sh
```

### Docker Compose

* Modify the `docker-compose.yaml` for your requirement
  * For example, `VEHICLE_NAME` or `FMS_CONNECTION`

* Run docker-compose

```shell
xhost +
docker compose up
```

* Follow [the tutoiral](https://github.com/evshary/zenoh_autoware_fms) to run FMS

* Stop docker-compose

```shell
docker compose down
```

* Clean environment

```shell
just clean
```
