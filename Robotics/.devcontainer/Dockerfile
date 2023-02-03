FROM osrf/ros:humble-desktop-full

# glvnd
RUN apt-get update && apt-get install -y --no-install-recommends \
  pkg-config \
  libxau-dev \
  libxdmcp-dev \
  libxcb1-dev \
  libxext-dev \
  libx11-dev \
  libglvnd0 \
  libgl1 \
  libglx0 \
  libegl1 \
  libgles2 \
  # Essential
  cmake curl zip unzip tar \
  && rm -rf /var/lib/apt/lists/*

COPY extra/10_nvidia.json /usr/share/glvnd/egl_vendor.d/10_nvidia.json

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

# VCPKG
RUN cd / \
  && git clone https://github.com/Microsoft/vcpkg.git -n \ 
  && cd vcpkg \
  && git checkout \
  && ./bootstrap-vcpkg.sh


COPY scripts/ros-activate.sh /etc/profile.d/ros-activate.sh

CMD ["/bin/bash"]
