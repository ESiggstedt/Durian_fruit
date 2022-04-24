#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 1:00:00
#SBATCH -J Remove_repeats_DNA
#SBATCH -o Remove_repeats_DNA.output
#SBATCH --mail-type=ALL
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se

module load bioinfo-tools
module load RepeatMasker/4.1.2-p1

RepeatMasker -pa 2 -species Malvaceae \
-dir /home/ellens/Durian_fruit/Analyses/10_Remove_repeats_DNA/Remove_repeats_DNA/ \
/home/ellens/Durian_fruit/Analyses/08_Correct_assembly_DNA/corrected_assembly.fasta
