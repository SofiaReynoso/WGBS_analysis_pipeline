

# WGBS analysis pipeline
Este repositorio contiene un flujo completo para análisis de datos de secuenciación de bisulfito de genoma completo (WGBS), incluyendo:  

- Control de calidad (FastQC, Trim Galore)
- Alineamiento y análisis con **Bismark**
- Alineamiento y análisis con **BSMAP**
- Merge de BAMs, deduplicación y extracción de metilación

![Graph](https://github.com/user-attachments/assets/0a44dfe4-d254-4f08-9477-72ef724389a3)

## Requisitos

- Docker >= 20.10
- Docker Compose (opcional, si querés usar `docker-compose.yml`)
- Archivos de datos en la carpeta `data/raw/` (FASTQ)  
- Genoma de referencia en `data/reference_genome/` (FASTA)

## Construir los contenedores Docker

### QC, trimming y Bismark:
```bash
docker build -f docker/Dockerfile -t wgbs_pipeline .
```
### BSMAP:
```bash
docker build -f docker/Dockerfile.bsmap -t wgbs_bsmap .
```

## Ejecutar los contenedores y correrlos:

### QC y trimming:
```bash
docker run -it -v /ruta/local/wgbs_analysis_pipeline/data:/work/data wgbs_pipeline bash

# Dentro del contenedor
source /opt/conda/etc/profile.d/conda.sh
conda activate wgbs_qc_env

bash /work/scripts/fastqc.sh
bash /work/scripts/trim_galore.sh
conda deactivate
```

### Bismark:
```bash
docker run -it -v /ruta/local/wgbs_analysis_pipeline/data:/work/data wgbs_pipeline bash

source /opt/conda/etc/profile.d/conda.sh
conda activate bismark_env
# Preparación del genoma
bash /work/scripts/bismark_genome_prep.sh

# Alineamiento
bash /work/scripts/bismark_alignment.sh

# Merge de BAMs
bash /work/scripts/merge_samtools.sh

# Deduplicación
bash /work/scripts/deduplicate_bismark.sh

# Extracción de metilación
bash /work/scripts/methylation_extraction.sh

conda deactivate
```

### BSMAP:
```bash
docker run -it -v /ruta/local/wgbs_analysis_pipeline/data:/work/data wgbs_bsmap bash

source /opt/conda/etc/profile.d/conda.sh
conda activate bsmap_env
# Alineamiento
bash /work/scripts/bsmap_alignment.sh

# Merge de BAMs
bash /work/scripts/bsmap_merge.sh

# Extracción de metilación
bash /work/scripts/bsmap_methratio.sh

conda deactivate
```

----

## 1. Inputs para el pipeline WGBS

### Genoma de referencia
- Ensamblaje: **GRCm39** (Mus musculus)  
- Fuente: [Ensembl]  
- Archivos utilizados: `Mus_musculus.GRCm39.dna.primary_assembly.fa`

### Datos de corazón (GSE82658, experimento ENCSR397YEG):
https://www.encodeproject.org/experiments/ENCSR397YEG/
- **Réplica 1**  
  - `ENCFF001ZVM.fastq` (718,506,938 lecturas; 71.8 Gbp)  
  - `ENCFF001ZVP.fastq` (652,720,883 lecturas; 65.2 Gbp)  
- **Réplica 2**  
  - `ENCFF001ZVR.fastq` (641,332,810 lecturas; 64.1 Gbp)  
  - `ENCFF001ZVT.fastq` (661,804,193 lecturas; 66.1 Gbp)

### Datos de riñón (GSE82451, experimento ENCSR128HOP):
https://www.encodeproject.org/experiments/ENCSR128HOP/
- **Réplica 1**  
  - `ENCFF001ZVU.fastq` (643,968,828 lecturas; 64.3 Gbp)  
  - `ENCFF001ZVX.fastq` (706,610,024 lecturas; 70.6 Gbp)  
- **Réplica 2**  
  - `ENCFF001ZWA.fastq` (635,147,721 lecturas; 63.5 Gbp)  
  - `ENCFF001ZWD.fastq` (654,339,599 lecturas; 65.4 Gbp)
