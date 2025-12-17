#!/bin/bash
set -euo pipefail

source /opt/conda/etc/profile.d/conda.sh
conda activate bismark_env

INPUT_DIR=/work/data/bismark_merged
OUTPUT_DIR=/work/data/bismark_deduplicated

mkdir -p "$OUTPUT_DIR"

for BAM_FILE in "$INPUT_DIR"/*.bam; do
    deduplicate_bismark --output_dir "$OUTPUT_DIR" "$BAM_FILE"
done

conda deactivate
