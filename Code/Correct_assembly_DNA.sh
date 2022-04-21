#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 1:00:00
#SBATCH -J Correct_assembly_DNA
#SBATCH -o Correct_assembly_DNA.output
#SBATCH --mail-type=ALL
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se

module load bioinfo-tools
module load Pilon/1.24

java -jar $PILON_HOME/pilon.jar --genome /home/ellens/Durian_fruit/Analyses/04_Genome_assembly_PacBio/assPB.contigs.fasta \
--frags /home/ellens/Durian_fruit/Analyses/07_mapping_PacBio_Illumina/mapped_pacbio_illumina.bam \
--threads 2 \
--outdir /home/ellens/Durian_fruit/Analyses/08_Correct_assembly_DNA/ --output corrected_assembly
