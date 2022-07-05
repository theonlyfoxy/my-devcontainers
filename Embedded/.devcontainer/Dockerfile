FROM ubuntu:focal

ARG DEBIAN_FRONTEND=noninteractive

# glvnd
RUN apt-get update && apt-get install -y --no-install-recommends \
    # Essential
    pkg-config \
    cmake curl wget zip unzip tar \
    # Glvnd
    libxau-dev \
    libxdmcp-dev \
    libxcb1-dev \
    libxext-dev \
    libx11-dev \
    libglvnd0 \
    libgl1 \
    libglx0 \
    libegl1 \
    libgles2
COPY extra/10_nvidia.json /usr/share/glvnd/egl_vendor.d/10_nvidia.json

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

# Platformio
RUN apt-get install -y --no-install-recommends python3 python3-venv avrdude avrdude-doc

# Cleanup
RUN rm -rf /var/lib/apt/lists/*

# COPY scripts/embedded-activate.sh /etc/profile.d/embedded-activate.sh

CMD ["/bin/bash"]