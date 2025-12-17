#!/bin/bash
set -euo pipefail

source /opt/conda/etc/profile.d/conda.sh
conda activate bismark_env

INPUT_DIR=/work/data/bismark
OUTPUT_DIR=/work/data/bismark/merged
OUTPUT_FILE=$OUTPUT_DIR/merged.bam #modificar segun nombre de interes
THREADS=4

mkdir -p "$OUTPUT_DIR"

samtools merge -@ "$THREADS" "$OUTPUT_FILE" \
  "$INPUT_DIR"/ENCFF001ZVU_trimmed_bismark_bt2.bam \ #modificar segun interes
  "$INPUT_DIR"/ENCFF001ZVX_trimmed_bismark_bt2.bam #modificar segun interes

conda deactivate
