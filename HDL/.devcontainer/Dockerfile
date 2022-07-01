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

# Logisim-Evolution
RUN apt-get install -y --no-install-recommends openjdk-17-jre
RUN mkdir -p /Logisim/Evolution && \
    wget -O /Logisim/Evolution/logisim-evolution.jar https://github.com/logisim-evolution/logisim-evolution/releases/download/v3.7.2/logisim-evolution-3.7.2-all.jar --no-check-certificate --quiet

# Logisim-Digital
RUN wget -O Digital.zip https://github.com/hneemann/Digital/releases/download/v0.29/Digital.zip --no-check-certificate --quiet && \
    unzip Digital.zip -d /Logisim && rm Digital.zip

# DigitalJS & Verilog Support
RUN apt-get install -y --no-install-recommends universal-ctags \
    iverilog \
    yosys \
    npm
RUN npm install -g yosys2digitaljs

# Cleanup
RUN rm -rf /var/lib/apt/lists/*

COPY scripts/hdl-activate.sh /etc/profile.d/hdl-activate.sh

CMD ["/bin/bash"]