#!/bin/bash

#SBATCH -A 
#SBATCH -p 
#SBATCH -t 20:00:00
#SBATCH -n 10
#SBATCH --mem=100G
#SBATCH --mail-user=
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --job-name=
#SBATCH --output=
#SBATCH --error=

module load python-miniconda3/4.12.0
eval "$(conda shell.bash hook)"

conda activate bismark_env

INPUT_DIR=/wgbs_data/Merged_Output
OUTPUT_DIR=/wgbs_data/Methylation_Output
INPUT_FILE=$INPUT_DIR/ENCBS562AAA.deduplicated.bam

mkdir -p $OUTPUT_DIR

bismark_methylation_extractor \
  --bedGraph \
  --gzip \
  --parallel 8 \
  --output $OUTPUT_DIR \
  $INPUT_FILE

conda deactivate

