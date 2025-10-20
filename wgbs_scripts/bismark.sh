#!/bin/bash

#SBATCH -A 
#SBATCH -p 
#SBATCH -t 48:00:00
#SBATCH -n 6
#SBATCH --mem=150G
#SBATCH --mail-user=
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --job-name=‘bismark-alignment'
#SBATCH --output=bismark-alignment.out
#SBATCH --error=bismark-alignment.err

module load python-miniconda3/4.12.0
eval "$(conda shell.bash hook)"

conda activate bismark_env

INPUT_DIR=/wgbs_data/TrimGalore_Output
OUTPUT_DIR=/wgbs_data/Bismark_Output
GENOME_DIR=/wgbs_data/Reference_genome

mkdir -p $OUTPUT_DIR

bismark --genome $GENOME_DIR \
        --output_dir $OUTPUT_DIR \
        --parallel 4 \
        $INPUT_DIR/ENCFF001ZVX_trimmed.fq.gz

conda deactivate

