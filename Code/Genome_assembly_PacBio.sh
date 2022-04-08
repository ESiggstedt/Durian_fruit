#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 19:00:00
#SBATCH -J Genome_assembly_PacBio
#SBATCH -o Genome_assembly_PacBio.output
#SBATCH --mail-type=ALL
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se

module load bioinfo-tools
module load canu/2.2

canu -p assPB useGrid=False -d /home/ellens/Durian_fruit/Analyses/04_Genome_assembly_PacBio genomeSize=24m corThreads=4 -pacbio /home/ellens/Durian_fruit/Data/Raw_data/pacbio_data/SRR6037732_scaffold_10.fq.gz
