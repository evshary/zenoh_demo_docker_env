FROM ros:galactic
RUN apt-get update 
RUN apt-get install -y ros-galactic-demo-nodes-cpp ros-galactic-rmw-cyclonedds-cpp ros-galactic-turtlesim wget unzip tmux inetutils-ping
RUN wget https://github.com/eclipse-zenoh/zenoh-plugin-dds/releases/download/0.7.0-rc/zenoh-bridge-dds-0.7.0-rc-x86_64-unknown-linux-gnu.zip
RUN unzip zenoh-bridge-dds-0.7.0-rc-x86_64-unknown-linux-gnu.zip
ENV RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
CMD bash
