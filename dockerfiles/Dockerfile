FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    wget \
    curl \
    git \
    ca-certificates \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh \
    && bash Miniconda3-latest-Linux-aarch64.sh -b -p /opt/conda \
    && rm Miniconda3-latest-Linux-aarch64.sh

ENV PATH=/opt/conda/bin:$PATH

COPY /envs/wgbs_qc_env.yml /envs/wgbs_qc_env.yml
COPY /envs/bismark_env.yml /envs/bismark_env.yml

RUN conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main && \
    conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r

RUN conda env create -f /envs/wgbs_qc_env.yml && \
    conda env create -f /envs/bismark_env.yml && \
    conda clean -a -y

SHELL ["/bin/bash", "-c"]

RUN conda init bash

CMD ["bash"]
