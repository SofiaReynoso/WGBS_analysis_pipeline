#!/bin/bash

#SBATCH -A b1042
#SBATCH -p genomics
#SBATCH -t 12:00:00
#SBATCH -n 6
#SBATCH --mem=100G
#SBATCH --mail-user=
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --job-name=
#SBATCH --output=
#SBATCH --error=


module load python-miniconda3/4.12.0
conda activate bismark_env

GENOME_DIR=/wgbs_data/Reference_genome

bismark_genome_preparation --bowtie2 $GENOME_DIR

conda deactivate
