#!/bin/bash

#SBATCH -A 
#SBATCH -p 
#SBATCH -t 4:00:00
#SBATCH -n 4
#SBATCH --mem=50G
#SBATCH --mail-user=
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --job-name='merge-samtools'
#SBATCH --output=merge-samtools.out
#SBATCH --error=merge-samtools.err

module load samtools

INPUT_DIR=/wgbs_data/Bsmap_Output
OUTPUT_DIR=/wgbs_data/Merged_Output
OUTPUT_FILE=$OUTPUT_DIR/ENCBS041AAA_bsmap.bam

mkdir -p $OUTPUT_DIR

samtools merge -@ 4 $OUTPUT_FILE \
  $INPUT_DIR/ENCFF001ZVP_mapped.bam \
  $INPUT_DIR/ENCFF001ZVM_mapped.bam

