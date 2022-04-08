#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 2:00:00
#SBATCH -J Trimming_Transcriptome.sh
#SBATCH -o Trimming_Transcriptome.output
#SBATCH --mail-type=ALL
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se

module load bioinfo-tools
module load trimmomatic/0.39

trimmomatic PE -threads 4 \
/home/ellens/Durian_fruit/Data/Raw_data/transcriptome/untrimmed/SRR6040095_scaffold_10.1.fastq.gz \
/home/ellens/Durian_fruit/Data/Raw_data/transcriptome/untrimmed/SRR6040095_scaffold_10.2.fastq.gz \
-baseout /home/ellens/Durian_fruit/Analyses/05_Trimmed_Transcriptome/trimmed_transcriptomes_scaffold_10 \
ILLUMINACLIP:/sw/bioinfo/trimmomatic/0.39/snowy/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
