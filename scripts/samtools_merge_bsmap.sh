#!/bin/bash
set -euo pipefail

source /opt/conda/etc/profile.d/conda.sh
conda activate bsmap_env

INPUT_DIR=/work/data/bsmap
OUTPUT_DIR=/work/data/merged
THREADS=4

mkdir -p "$OUTPUT_DIR"

OUTPUT_FILE="$OUTPUT_DIR/merged.bam"

samtools merge -@ "$THREADS" "$OUTPUT_FILE" \
  "$INPUT_DIR/ENCFF001ZVP_mapped.bam" \
  "$INPUT_DIR/ENCFF001ZVM_mapped.bam"

conda deactivate

