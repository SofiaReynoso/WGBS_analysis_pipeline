#!/bin/bash

#SBATCH -A 
#SBATCH -p 
#SBATCH -t 4:00:00
#SBATCH -n 4
#SBATCH --mem=50G
#SBATCH --mail-user=
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --job-name=
#SBATCH --output=
#SBATCH --error=

module load python-miniconda3/4.12.0
eval "$(conda shell.bash hook)"
conda activate bismark_env


INPUT_DIR=/wgbs_data/Bismark_Output
OUTPUT_DIR=/wgbs_data/Merged_Output
OUTPUT_FILE=$OUTPUT_DIR/ENCBS046AAA_1.bam

mkdir -p $OUTPUT_DIR

samtools merge -@ 4 $OUTPUT_FILE \
  $INPUT_DIR/ENCFF001ZVU_trimmed_bismark_bt2.bam \
  $INPUT_DIR/ENCFF001ZVX_trimmed_bismark_bt2.bam

conda deactivate

