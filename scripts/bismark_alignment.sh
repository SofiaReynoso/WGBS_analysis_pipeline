#!/bin/bash
set -euo pipefail

source /opt/conda/etc/profile.d/conda.sh
conda activate bismark_env

INPUT_DIR=/work/data/trimmed
OUTPUT_DIR=/work/data/bismark
GENOME_DIR=/work/data/reference_genome

THREADS=4

mkdir -p "$OUTPUT_DIR"

if [ ! -d "$GENOME_DIR/Bisulfite_Genome" ]; then
  echo "ERROR: Run genome preparation first."
  exit 1
fi

shopt -s nullglob
FASTQ_FILES=("$INPUT_DIR"/*_trimmed.fq.gz)

for fq in "${FASTQ_FILES[@]}"; do
  echo "Aligning: $(basename "$fq")"

  bismark \
    --genome "$GENOME_DIR" \
    --output_dir "$OUTPUT_DIR" \
    --parallel "$THREADS" \
    "$fq"
done

conda deactivate
