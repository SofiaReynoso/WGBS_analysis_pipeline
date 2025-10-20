#!/bin/bash

#SBATCH -A 
#SBATCH -p 
#SBATCH -t 4:00:00
#SBATCH -n 4
#SBATCH --mem=24G
#SBATCH --mail-user=
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --job-name='fastqc'
#SBATCH --output=fastqc.out
#SBATCH --error=fastqc.err

module load fastqc/0.12.0

INPUT_DIR=/wgbs_data/Input_files  
OUTPUT_DIR=/wgbs_data/FastQC_Output

mkdir -p $OUTPUT_DIR

fastqc -o $OUTPUT_DIR -t 4 $INPUT_DIR/*.fastq.gz

