FROM ros:humble
RUN apt-get update 
# Install necessary packages
RUN apt-get install -y ros-humble-demo-nodes-cpp \
                       ros-humble-rmw-cyclonedds-cpp \
                       ros-humble-turtlesim \
                       wget unzip tmux inetutils-ping

# Install Rust
RUN apt-get install -y build-essential curl llvm-dev libclang-dev cmake
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# Build zenoh-bridge-ros2dds
RUN git clone https://github.com/eclipse-zenoh/zenoh-plugin-ros2dds.git
RUN cd zenoh-plugin-ros2dds && cargo build --release -p zenoh-bridge-ros2dds

CMD bash
