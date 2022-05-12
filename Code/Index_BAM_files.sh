#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:30:00
#SBATCH -J Index_BAM_files
#SBATCH -o Index_BAM_files.output
#SBATCH --mail-type=ALL
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se

module load bioinfo-tools
module load samtools/1.14

samtools index -@ 2 /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/sorted_trimmed_transcriptomes_scaffold_10_P_mappedAligned.out.bam
samtools index -@ 2 /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/sorted_trimmed_transcriptomes_scaffold_10_U_mappedAligned.out.bam
samtools index -@ 2 /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/sorted_SRR6040092_scaffold_10_mappedAligned.out.bam
samtools index -@ 2 /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/sorted_SRR6040093_scaffold_10_mappedAligned.out.bam
samtools index -@ 2 /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/sorted_SRR6040094_scaffold_10_mappedAligned.out.bam
samtools index -@ 2 /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/sorted_SRR6040096_scaffold_10_mappedAligned.out.bam
samtools index -@ 2 /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/sorted_SRR6040097_scaffold_10_mappedAligned.out.bam
samtools index -@ 2 /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/sorted_SRR6156066_scaffold_10_mappedAligned.out.bam
samtools index -@ 2 /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/sorted_SRR6156067_scaffold_10_mappedAligned.out.bam
samtools index -@ 2 /home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/sorted_SRR6156069_scaffold_10_mappedAligned.out.bam
