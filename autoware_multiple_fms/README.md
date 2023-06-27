# Multiple Autoware with FMS

The script setups several Autoware with zenoh-bridge-dds for FMS test environment.

# Steps

* Build docker images

```shell
./build.sh
```

* Modify the `docker-compose.yaml` for your requirement
  - For example, `VEHICLE_NAME` or `FMS_CONNECTION`

* Run docker-compose

```shell
docker compose up
```

* Run FMS: https://github.com/evshary/zenoh_autoware_fms

* Stop docker-compose

```shell
docker compose down
```

* Clean environment

```shell
./clean.sh
```

* Debug (Go inside the docker container)

```shell
./run.sh
```

