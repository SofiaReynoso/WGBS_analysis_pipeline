#!/bin/bash

#SBATCH -A 
#SBATCH -p 
#SBATCH -t 24:00:00
#SBATCH -n 6
#SBATCH --mem=100G
#SBATCH --mail-user=
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --job-name='methratio'
#SBATCH --output=methratio.out
#SBATCH --error=methratio.err

source ~/.bashrc
conda activate /wgbs_data/.conda/envs/bsmap_analysis_env

INPUT_DIR=/wgbs_data/Merged_Output
OUTPUT_DIR=/wgbs_data/Methylation_Output
GENOME_DIR=/wgbs_data/Reference_genome

mkdir -p $OUTPUT_DIR

python /wgbs_data/.conda/envs/bsmap_analysis_env/bin/methratio.py \
    -o $OUTPUT_DIR/ENCBS557AAA_bsmap_methylation.txt \
    -d $GENOME_DIR/GRCm39.primary_assembly.genome.fa \
    -r \
    $INPUT_DIR/ENCBS557AAA_bsmap.bam

conda deactivate

