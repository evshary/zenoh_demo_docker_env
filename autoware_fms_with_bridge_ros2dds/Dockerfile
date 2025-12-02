FROM ghcr.io/autowarefoundation/autoware:universe-devel-1.5.0-amd64

# For just
RUN wget -qO - 'https://proget.makedeb.org/debian-feeds/prebuilt-mpr.pub' | gpg --dearmor | sudo tee /usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg 1> /dev/null
RUN echo "deb [arch=all,$(dpkg --print-architecture) signed-by=/usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg] https://proget.makedeb.org prebuilt-mpr $(lsb_release -cs)" | sudo tee /etc/apt/sources.list.d/prebuilt-mpr.list

# Download necessary packages
RUN apt-get update
# Useful tools
RUN apt-get install -y wget unzip tmux inetutils-ping curl vim parallel just tig pipx
RUN printf 'set-option -g default-shell /bin/bash\nset -g default-terminal "tmux-256color"' > /etc/tmux.conf
# Used by zenoh-bridge-ros2dds
RUN apt-get install -y llvm-dev libclang-dev cmake
# Used by Autoware & my ROS packages
RUN python3 -m pip install gdown
RUN pipx install ansible
RUN apt-get install -y ros-humble-moveit-msgs \
                       ros-humble-object-recognition-msgs \
                       ros-humble-octomap-msgs \
                       ros-humble-rmw-zenoh-cpp

# Install zenoh-bridge-ros2dds
RUN curl -L https://download.eclipse.org/zenoh/debian-repo/zenoh-public-key | sudo gpg --dearmor --yes --output /etc/apt/keyrings/zenoh-public-key.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/zenoh-public-key.gpg] https://download.eclipse.org/zenoh/debian-repo/ /" | sudo tee -a /etc/apt/sources.list > /dev/null
RUN apt-get update
RUN apt-get install zenoh-bridge-ros2dds

# Environment
ENV DOCKER_IMAGE=autoware-humble
ENV TERM=xterm-256color
RUN echo 'source /opt/autoware/setup.bash' >> ~/.bashrc
RUN echo 'export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp' >> ~/.bashrc

# Install Autoware map
RUN gdown -O ~/autoware_map/ 'https://docs.google.com/uc?export=download&id=1499_nsbUbIeturZaDj7jhUownh5fvXHd'
RUN unzip -d ~/autoware_map ~/autoware_map/sample-map-planning.zip

# Set home folder
WORKDIR /root/runtime

CMD bash
