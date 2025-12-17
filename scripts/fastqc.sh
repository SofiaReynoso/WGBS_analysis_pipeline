#!/bin/bash
set -euo pipefail

source /opt/conda/etc/profile.d/conda.sh
conda activate wgbs_qc_env

INPUT_DIR=/work/data/raw
OUTPUT_DIR=/work/data/qc/fastqc

mkdir -p "$OUTPUT_DIR"

fastqc -t 4 -o "$OUTPUT_DIR" "$INPUT_DIR"/*.fastq.gz

conda deactivate


