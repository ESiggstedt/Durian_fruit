#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 01:00:00
#SBATCH -J Mapping_DNA_transcriptome
#SBATCH -o Mapping_DNA_transcriptome.output
#SBATCH --mail-type=ALL
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se

module load bioinfo-tools
module load star/2.7.9a

star --runThreadN 8 --runMode genomeGenerate \
--genomeDir /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome \
--genomeFastaFiles /home/ellens/Durian_fruit/Analyses/10_Remove_repeats_DNA/Remove_repeats_DNA/corrected_assembly.fasta.masked

star --runThreadN 8 --genomeDir /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome \
--readFilesIn /home/ellens/Durian_fruit/Analyses/05_Trimmed_Transcriptome/trimmed_transcriptomes_scaffold_10_1P \
/home/ellens/Durian_fruit/Analyses/05_Trimmed_Transcriptome/trimmed_transcriptomes_scaffold_10_2P \
--outFileNamePrefix /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/trimmed_transcriptomes_scaffold_10_P_mapped &

star --runThreadN 8 --genomeDir /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome \
--readFilesIn /home/ellens/Durian_fruit/Analyses/05_Trimmed_Transcriptome/trimmed_transcriptomes_scaffold_10_1U \
/home/ellens/Durian_fruit/Analyses/05_Trimmed_Transcriptome/trimmed_transcriptomes_scaffold_10_2U \
--outFileNamePrefix /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/trimmed_transcriptomes_scaffold_10_U_mapped &

star --runThreadN 8 --genomeDir /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome \
--readFilesIn /home/ellens/Durian_fruit/Data/Raw_data/transcriptome/trimmed/SRR6040092_scaffold_10.1.fastq.gz \
/home/ellens/Durian_fruit/Data/Raw_data/transcriptome/trimmed/SRR6040092_scaffold_10.2.fastq.gz \
--readFilesCommand zcat \
--outFileNamePrefix /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/SRR6040092_scaffold_10_mapped &

star --runThreadN 8 --genomeDir /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome \
--readFilesIn /home/ellens/Durian_fruit/Data/Raw_data/transcriptome/trimmed/SRR6040093_scaffold_10.1.fastq.gz \
/home/ellens/Durian_fruit/Data/Raw_data/transcriptome/trimmed/SRR6040093_scaffold_10.2.fastq.gz \
--readFilesCommand zcat \
--outFileNamePrefix /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/SRR6040093_scaffold_10_mapped &

star --runThreadN 8 --genomeDir /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome \
--readFilesIn /home/ellens/Durian_fruit/Data/Raw_data/transcriptome/trimmed/SRR6040094_scaffold_10.1.fastq.gz \
/home/ellens/Durian_fruit/Data/Raw_data/transcriptome/trimmed/SRR6040094_scaffold_10.2.fastq.gz \
--readFilesCommand zcat \
--outFileNamePrefix /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/SRR6040094_scaffold_10_mapped &

star --runThreadN 8 --genomeDir /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome \
--readFilesIn /home/ellens/Durian_fruit/Data/Raw_data/transcriptome/trimmed/SRR6040096_scaffold_10.1.fastq.gz \
/home/ellens/Durian_fruit/Data/Raw_data/transcriptome/trimmed/SRR6040096_scaffold_10.2.fastq.gz \
--readFilesCommand zcat \
--outFileNamePrefix /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/SRR6040096_scaffold_10_mapped &

star --runThreadN 8 --genomeDir /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome \
--readFilesIn /home/ellens/Durian_fruit/Data/Raw_data/transcriptome/trimmed/SRR6040097_scaffold_10.1.fastq.gz \
/home/ellens/Durian_fruit/Data/Raw_data/transcriptome/trimmed/SRR6040097_scaffold_10.2.fastq.gz \
--readFilesCommand zcat \
--outFileNamePrefix /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/SRR6040097_scaffold_10_mapped &

star --runThreadN 8 --genomeDir /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome \
--readFilesIn /home/ellens/Durian_fruit/Data/Raw_data/transcriptome/trimmed/SRR6156066_scaffold_10.1.fastq.gz \
/home/ellens/Durian_fruit/Data/Raw_data/transcriptome/trimmed/SRR6156066_scaffold_10.2.fastq.gz \
--readFilesCommand zcat \
--outFileNamePrefix /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/SRR6156066_scaffold_10_mapped &

star --runThreadN 8 --genomeDir /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome \
--readFilesIn /home/ellens/Durian_fruit/Data/Raw_data/transcriptome/trimmed/SRR6156067_scaffold_10.1.fastq.gz \
/home/ellens/Durian_fruit/Data/Raw_data/transcriptome/trimmed/SRR6156067_scaffold_10.2.fastq.gz \
--readFilesCommand zcat \
--outFileNamePrefix /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/SRR6156067_scaffold_10_mapped &

star --runThreadN 8 --genomeDir /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome \
--readFilesIn /home/ellens/Durian_fruit/Data/Raw_data/transcriptome/trimmed/SRR6156069_scaffold_10.1.fastq.gz \
/home/ellens/Durian_fruit/Data/Raw_data/transcriptome/trimmed/SRR6156069_scaffold_10.2.fastq.gz \
--readFilesCommand zcat \
--outFileNamePrefix /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/SRR6156069_scaffold_10_mapped &

wait
