#!/bin/bash
# Script para transformar los outputs de BSmap a formato DSS

# Carpeta con los archivos de BSmap
input_dir="/wgbs_data/bsmap_methylation_call"

for file in "$input_dir"/*_bsmap_methylation.txt; do
    # Filtrar solo contexto CG y reordenar columnas para DSS
    awk -F"\t" '$4 == "CG" {print $1, $2, $8, $7}' OFS="\t" "$file" \
        > "${file/_bsmap_methylation.txt/_DSS.txt}"
done
