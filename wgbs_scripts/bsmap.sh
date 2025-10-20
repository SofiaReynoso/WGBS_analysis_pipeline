#!/bin/bash

#SBATCH -A 
#SBATCH -p 
#SBATCH -t 48:00:00
#SBATCH -n 10
#SBATCH --mem=150G
#SBATCH --mail-user=
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --job-name='bsmap_se'
#SBATCH --output=bsmap_se.out
#SBATCH --error=bsmap_se.err

source ~/.bashrc
conda activate /wgbs_data/.conda/envs/bsmap_analysis_env

INPUT_DIR=/wgbs_data/TrimGalore_Output
OUTPUT_DIR=/wgbs_data/Bsmap_Output
GENOME_DIR=/wgbs_data/Reference_genome

mkdir -p $OUTPUT_DIR

bsmap \
    -a $INPUT_DIR/ENCFF001ZVM_trimmed.fq.gz \
    -d $GENOME_DIR/GRCm39.primary_assembly.genome.fa \
    -o $OUTPUT_DIR/ENCFF001ZVM_mapped.bam

conda deactivate

