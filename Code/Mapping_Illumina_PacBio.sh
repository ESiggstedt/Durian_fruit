#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 2:00:00
#SBATCH -J Mapping_Illumina_PacBio
#SBATCH -o Mapping_Illumina_PacBio.output
#SBATCH --mail-type=ALL
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se

module load bioinfo-tools
module load bwa/0.7.17
module load samtools/1.14

bwa index /home/ellens/Durian_fruit/Analyses/04_Genome_assembly_PacBio/assPB.contigs.fasta


bwa mem -t 2 /home/ellens/Durian_fruit/Analyses/04_Genome_assembly_PacBio/assPB.contigs.fasta \
/home/ellens/Durian_fruit/Data/Raw_data/illumina_data/SRR6058604_scaffold_10.1P.fastq.gz \
/home/ellens/Durian_fruit/Data/Raw_data/illumina_data/SRR6058604_scaffold_10.2P.fastq.gz \
> /home/ellens/Durian_fruit/Analyses/07_mapping_PacBio_Illumina/mapped_pacbio_illumina.sam

samtools sort -@ 2 /home/ellens/Durian_fruit/Analyses/07_mapping_PacBio_Illumina/mapped_pacbio_illumina.sam \
-o /home/ellens/Durian_fruit/Analyses/07_mapping_PacBio_Illumina/mapped_pacbio_illumina.bam
