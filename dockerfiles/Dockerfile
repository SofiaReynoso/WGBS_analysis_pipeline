# ==================================================
# WGBS multi-arch container (x86_64 / aarch64)
# ==================================================
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    wget curl git ca-certificates build-essential \
    bzip2 \
    && rm -rf /var/lib/apt/lists/*

RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "x86_64" ]; then \
        MINICONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"; \
    elif [ "$ARCH" = "aarch64" ]; then \
        MINICONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh"; \
    else \
        echo "Arquitectura no soportada: $ARCH" && exit 1; \
    fi && \
    wget $MINICONDA_URL -O /tmp/miniconda.sh && \
    bash /tmp/miniconda.sh -b -p /opt/conda && \
    rm /tmp/miniconda.sh

ENV PATH=/opt/conda/bin:$PATH

COPY envs/wgbs_qc_env.yml /envs/wgbs_qc_env.yml
COPY envs/bismark_env.yml /envs/bismark_env.yml
COPY envs/bsmap_env2.yml /envs/bsmap_env2.yml

RUN conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main && \
    conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r

RUN conda env create -f /envs/wgbs_qc_env.yml && \
    conda env create -f /envs/bismark_env.yml && \
    conda env create -f /envs/bsmap_env2.yml && \
    conda clean -a -y


SHELL ["/bin/bash", "-c"]
RUN conda init bash

CMD ["bash"]

