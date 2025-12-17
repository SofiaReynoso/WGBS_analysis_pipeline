#!/bin/bash
set -euo pipefail

source /opt/conda/etc/profile.d/conda.sh
conda activate bsmap_env

INPUT_DIR=/work/data/bsmap
OUTPUT_DIR=/work/data/bsmap/merged
THREADS=4

mkdir -p "$OUTPUT_DIR"

OUTPUT_FILE="$OUTPUT_DIR/merged.bam" #modificar segun interes

samtools merge -@ "$THREADS" "$OUTPUT_FILE" \
  "$INPUT_DIR/ENCFF001ZVP_mapped.bam" \ #modificar segun interes
  "$INPUT_DIR/ENCFF001ZVM_mapped.bam" #modificar segun interes

conda deactivate

