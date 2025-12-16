# WGBS_analysis_pipeline
Scripts y pipeline utilizados para el análisis de datos de secuenciación de bisulfito de genoma completo (WGBS). Este repositorio se encuentra asociado al desarrollo de mi tesis de maestría en Bioinformática y Biología de Sistemas.

----

## 1. Inputs para el pipeline WGBS

### Genoma de referencia
- Ensamblaje: **GRCm39** (Mus musculus)  
- Fuente: [Ensembl]  
- Archivos utilizados: `Mus_musculus.GRCm39.dna.primary_assembly.fa`

### Datos de corazón (GSE82658, experimento ENCSR397YEG): https://www.encodeproject.org/experiments/ENCSR397YEG/
- **Réplica 1**  
  - `ENCFF001ZVM.fastq` (718,506,938 lecturas; 71.8 Gbp)  
  - `ENCFF001ZVP.fastq` (652,720,883 lecturas; 65.2 Gbp)  
- **Réplica 2**  
  - `ENCFF001ZVR.fastq` (641,332,810 lecturas; 64.1 Gbp)  
  - `ENCFF001ZVT.fastq` (661,804,193 lecturas; 66.1 Gbp)

### Datos de riñón (GSE82451, experimento ENCSR128HOP): https://www.encodeproject.org/experiments/ENCSR128HOP/
- **Réplica 1**  
  - `ENCFF001ZVU.fastq` (643,968,828 lecturas; 64.3 Gbp)  
  - `ENCFF001ZVX.fastq` (706,610,024 lecturas; 70.6 Gbp)  
- **Réplica 2**  
  - `ENCFF001ZWA.fastq` (635,147,721 lecturas; 63.5 Gbp)  
  - `ENCFF001ZWD.fastq` (654,339,599 lecturas; 65.4 Gbp)
