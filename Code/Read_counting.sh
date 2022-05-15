#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 6:00:00
#SBATCH -J Read_counting
#SBATCH -o Read_counting.output
#SBATCH --mail-type=ALL
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se

module load bioinfo-tools
module load htseq/0.12.4

/sw/bioinfo/htseq/0.12.4/snowy/bin/htseq-count \
--format=bam --order pos --nprocesses 8 --samout=Read_counting --idattr ID \
/home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/sorted_SRR6040092_scaffold_10_mappedAligned.out.bam \
/home/ellens/Durian_fruit/Analyses/12_Structural_annotation/braker/Durio_zibethinus/augustus.hints.gff3 \
--counts_output /home/ellens/Durian_fruit/Analyses/14_Read_counting/SRR6040092_counted

/sw/bioinfo/htseq/0.12.4/snowy/bin/htseq-count \
--format=bam --order pos --nprocesses 8 --samout=Read_counting --idattr ID \
/home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/sorted_SRR6040093_scaffold_10_mappedAligned.out.bam \
/home/ellens/Durian_fruit/Analyses/12_Structural_annotation/braker/Durio_zibethinus/augustus.hints.gff3 \
--counts_output /home/ellens/Durian_fruit/Analyses/14_Read_counting/SRR6040093_counted

/sw/bioinfo/htseq/0.12.4/snowy/bin/htseq-count \
--format=bam --order pos --nprocesses 8 --samout=Read_counting --idattr ID \
/home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/sorted_SRR6040094_scaffold_10_mappedAligned.out.bam \
/home/ellens/Durian_fruit/Analyses/12_Structural_annotation/braker/Durio_zibethinus/augustus.hints.gff3 \
--counts_output /home/ellens/Durian_fruit/Analyses/14_Read_counting/SRR6040094_counted

/sw/bioinfo/htseq/0.12.4/snowy/bin/htseq-count \
--format=bam --order pos --nprocesses 8 --samout=Read_counting --idattr ID \
/home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/sorted_SRR6040096_scaffold_10_mappedAligned.out.bam \
/home/ellens/Durian_fruit/Analyses/12_Structural_annotation/braker/Durio_zibethinus/augustus.hints.gff3 \
--counts_output /home/ellens/Durian_fruit/Analyses/14_Read_counting/SRR6040096_counted

/sw/bioinfo/htseq/0.12.4/snowy/bin/htseq-count \
--format=bam --order pos --nprocesses 8 --samout=Read_counting --idattr ID \
/home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/sorted_SRR6040097_scaffold_10_mappedAligned.out.bam \
/home/ellens/Durian_fruit/Analyses/12_Structural_annotation/braker/Durio_zibethinus/augustus.hints.gff3 \
--counts_output /home/ellens/Durian_fruit/Analyses/14_Read_counting/SRR6040097_counted

/sw/bioinfo/htseq/0.12.4/snowy/bin/htseq-count \
--format=bam --order pos --nprocesses 8 --samout=Read_counting --idattr ID \
/home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/sorted_SRR6156066_scaffold_10_mappedAligned.out.bam \
/home/ellens/Durian_fruit/Analyses/12_Structural_annotation/braker/Durio_zibethinus/augustus.hints.gff3 \
--counts_output /home/ellens/Durian_fruit/Analyses/14_Read_counting/SRR6156066_counted

/sw/bioinfo/htseq/0.12.4/snowy/bin/htseq-count \
--format=bam --order pos --nprocesses 8 --samout=Read_counting --idattr ID \
/home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/sorted_SRR6156069_scaffold_10_mappedAligned.out.bam \
/home/ellens/Durian_fruit/Analyses/12_Structural_annotation/braker/Durio_zibethinus/augustus.hints.gff3 \
--counts_output /home/ellens/Durian_fruit/Analyses/14_Read_counting/SRR6156069_counted

/sw/bioinfo/htseq/0.12.4/snowy/bin/htseq-count \
--format=bam --order pos --nprocesses 8 --samout=Read_counting --idattr ID \
/home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/sorted_SRR6156067_scaffold_10_mappedAligned.out.bam \
/home/ellens/Durian_fruit/Analyses/12_Structural_annotation/braker/Durio_zibethinus/augustus.hints.gff3 \
--counts_output /home/ellens/Durian_fruit/Analyses/14_Read_counting/SRR6156067_counted

/sw/bioinfo/htseq/0.12.4/snowy/bin/htseq-count \
--format=bam --order pos --nprocesses 8 --samout=Read_counting --idattr ID \
/home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/sorted_trimmed_transcriptomes_scaffold_10_P_mappedAligned.out.bam \
/home/ellens/Durian_fruit/Analyses/12_Structural_annotation/braker/Durio_zibethinus/augustus.hints.gff3 \
--counts_output /home/ellens/Durian_fruit/Analyses/14_Read_counting/trimmed_P_counted

/sw/bioinfo/htseq/0.12.4/snowy/bin/htseq-count \
--format=bam --order pos --nprocesses 8 --samout=Read_counting --idattr ID \
/home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/sorted_trimmed_transcriptomes_scaffold_10_U_mappedAligned.out.bam \
/home/ellens/Durian_fruit/Analyses/12_Structural_annotation/braker/Durio_zibethinus/augustus.hints.gff3 \
--counts_output /home/ellens/Durian_fruit/Analyses/14_Read_counting/trimmed_U_counted
