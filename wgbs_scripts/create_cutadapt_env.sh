#!/bin/bash

module load python-miniconda3/4.12.0


conda create -n cutadapt_env -c bioconda cutadapt -y
conda activate cutadapt_env

conda install -c bioconda trim-galore -y
