#!/bin/bash
# ==========================================================
#  Bismark environment setup (for HPC use)
# ==========================================================

module load python-miniconda3/4.12.0

if ! conda info --envs | grep -q 'bismark_env'; then
  conda create -y -n bismark_env -c bioconda bismark bowtie2 samtools
fi

conda activate bismark_env
