#!/bin/bash
set -euo pipefail

source /opt/conda/etc/profile.d/conda.sh
conda activate bismark_env

GENOME_DIR=/work/data/reference_genome

bismark_genome_preparation --bowtie2 "$GENOME_DIR"

conda deactivate
