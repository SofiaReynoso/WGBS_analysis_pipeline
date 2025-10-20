#!/bin/bash

#SBATCH -A 
#SBATCH -p 
#SBATCH -t 4:00:00
#SBATCH -n 6
#SBATCH --mem=100G
#SBATCH --mail-user=
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --job-name=
#SBATCH --output=
#SBATCH --error=

module load python-miniconda3/4.12.0
conda activate cutadapt_env

INPUT_FILE=/wgbs_data/ENCFF001ZVX.fastq.gz
OUTPUT_DIR=/wgbs_data/TrimGalore_Output

mkdir -p $OUTPUT_DIR

trim_galore --fastqc --cores 4 -o $OUTPUT_DIR $INPUT_FILE

conda deactivate

