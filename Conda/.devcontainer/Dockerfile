# cuda
FROM nvidia/cuda:11.2.1-cudnn8-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive

# glvnd
RUN apt-get update && apt-get install -y --no-install-recommends \
    # Essential
    pkg-config \
    cmake curl wget bzip2 tar ca-certificates git \
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

# miniconda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-4.5.11-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean -tipsy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc


# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

# Cleanup
RUN rm -rf /var/lib/apt/lists/*

# COPY scripts/conda-activate.sh /etc/profile.d/conda-activate.sh

CMD ["/bin/bash"]