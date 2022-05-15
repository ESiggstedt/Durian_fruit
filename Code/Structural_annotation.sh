#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 4:00:00
#SBATCH -J Structural_annotation
#SBATCH -o Structural_annotation.output
#SBATCH --mail-type=ALL
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se

module load bioinfo-tools
module load braker/2.1.1_Perl5.24.1
module load augustus/3.2.3_Perl5.24.1
module load bamtools/2.5.1
module load blast/2.9.0+
module load GenomeThreader/1.7.0
module load samtools/1.8
module load GeneMark/4.33-es_Perl5.24.1

# chmod a+w -R /home/ellens/Durian_fruit/Analyses/12_Structural_annotation/augustus_config/species/
# cp -vf /sw/bioinfo/GeneMark/4.33-es/snowy/gm_key $HOME/.gm_key

braker.pl --species="Durio zibethinus" \
--AUGUSTUS_CONFIG_PATH=/home/ellens/Durian_fruit/Analyses/12_Structural_annotation/augustus_config \
--AUGUSTUS_BIN_PATH=/sw/bioinfo/augustus/3.4.0/snowy/bin \
--AUGUSTUS_SCRIPTS_PATH=/sw/bioinfo/augustus/3.4.0/snowy/scripts \
--GENEMARK_PATH=/sw/bioinfo/GeneMark/4.33-es/snowy \
--useexisting \
--gff3 \
--cores=8 \
--genome=/home/ellens/Durian_fruit/Analyses/10_Remove_repeats_DNA/Remove_repeats_DNA/corrected_assembly.fasta.masked \
--bam=/home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/SRR6040092_scaffold_10_mappedAligned.out.bam, \
/home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/SRR6040097_scaffold_10_mappedAligned.out.bam, \
/home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/trimmed_transcriptomes_scaffold_10_P_mappedAligned.out.bam, \
/home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/SRR6040093_scaffold_10_mappedAligned.out.bam, \
/home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/SRR6156066_scaffold_10_mappedAligned.out.bam, \
/home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/trimmed_transcriptomes_scaffold_10_U_mappedAligned.out.bam, \
/home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/SRR6040094_scaffold_10_mappedAligned.out.bam, \
/home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/SRR6156067_scaffold_10_mappedAligned.out.bam, \
/home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/SRR6040096_scaffold_10_mappedAligned.out.bam, \
/home/ellens/Durian_fruit/Analyses/11_mapping_DNA_transcriptome/SRR6156069_scaffold_10_mappedAligned.out.bam \
