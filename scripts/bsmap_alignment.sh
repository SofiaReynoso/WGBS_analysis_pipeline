#!/bin/bash
set -euo pipefail

source /opt/conda/etc/profile.d/conda.sh
conda activate bsmap_env

INPUT_DIR=/work/data/trimmed
OUTPUT_DIR=/work/data/bsmap
GENOME_FILE=/work/data/reference_genome/GRCm39.primary_assembly.genome.fa

mkdir -p "$OUTPUT_DIR"

shopt -s nullglob
for FASTQ_FILE in "$INPUT_DIR"/*_trimmed.fq.gz; do
    BASENAME=$(basename "$FASTQ_FILE" _trimmed.fq.gz)
    OUTPUT_BAM="$OUTPUT_DIR/${BASENAME}_mapped.bam"
    
    bsmap \
        -a "$FASTQ_FILE" \
        -d "$GENOME_FILE" \
        -o "$OUTPUT_BAM" 
done

conda deactivate

