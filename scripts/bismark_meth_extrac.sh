#!/bin/bash
set -euo pipefail

source /opt/conda/etc/profile.d/conda.sh
conda activate bismark_env

INPUT_DIR=/work/data/bismark_deduplicated
OUTPUT_DIR=/work/data/bismark_methylation
mkdir -p "$OUTPUT_DIR"

for BAM_FILE in "$INPUT_DIR"/*.deduplicated.bam; do
    bismark_methylation_extractor \
        --bedGraph \
        --gzip \
        --parallel 8 \
        --output "$OUTPUT_DIR" \
        "$BAM_FILE"
done

conda deactivate
