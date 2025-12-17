#!/bin/bash
set -euo pipefail

# Activar entorno
source /opt/conda/etc/profile.d/conda.sh
conda activate bsmap_env

INPUT_DIR=/work/data/bsmap/merged
OUTPUT_DIR=/work/data/bsmap/methylation
GENOME_DIR=/work/data/reference_genome

mkdir -p "$OUTPUT_DIR"

shopt -s nullglob
BAM_FILES=("$INPUT_DIR"/*.bam)


for BAM_FILE in "${BAM_FILES[@]}"; do
    BASENAME=$(basename "$BAM_FILE" .bam)
    OUTPUT_FILE="$OUTPUT_DIR/${BASENAME}_methylation.txt"

    python /opt/conda/envs/bsmap_env/bin/methratio.py \
        -o "$OUTPUT_FILE" \
        -d "$GENOME_DIR/GRCm39.primary_assembly.genome.fa" \
        -r \
        "$BAM_FILE"
done

conda deactivate

