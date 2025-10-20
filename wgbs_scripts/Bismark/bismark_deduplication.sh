#!/bin/bash

#SBATCH -A 
#SBATCH -p 
#SBATCH -t 8:00:00
#SBATCH -n 4
#SBATCH --mem=100G
#SBATCH --mail-user=
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --job-name=
#SBATCH --output=
#SBATCH --error=

module load python-miniconda3/4.12.0
eval "$(conda shell.bash hook)"

conda activate bismark_env

cd /wgbs_data/Merged_Output
deduplicate_bismark ENCBS046AAA_1.bam

conda deactivate

