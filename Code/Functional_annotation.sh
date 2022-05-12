#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 6:00:00
#SBATCH -J Functional_annotation
#SBATCH -o Functional_annotation.output
#SBATCH --mail-type=ALL
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se

module load bioinfo-tools
module load eggNOG-mapper/2.1.5

/sw/bioinfo/eggNOG-mapper/2.1.5/snowy/bin/emapper.py \
-i /home/ellens/Durian_fruit/Analyses/10_Remove_repeats_DNA/Remove_repeats_DNA/corrected_assembly.fasta.masked \
-o Functional_annotations \
--output_dir /home/ellens/Durian_fruit/Analyses/13_Functional_annotation \
--itype genome \
--cpu 4
