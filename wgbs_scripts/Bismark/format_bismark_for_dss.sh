#!/bin/bash
# Script para transformar los outputs de Bismark a formato DSS

# Carpeta con los archivos .cov de Bismark
input_dir="/wgbs_data/bismark_methylation_call_cov"

for file in "$input_dir"/*.cov; do
    output="${file%.cov}_DSS_input.txt"
    awk '{chr = $1; pos = $2; N = $5 + $6; X = $5; print chr, pos, N, X}' "$file" > "$output"
done
