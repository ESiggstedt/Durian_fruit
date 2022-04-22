#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 1:00:00
#SBATCH -J Assembly_evaluation_DNA
#SBATCH -o Assembly_evaluation_DNA.output
#SBATCH --mail-type=ALL
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se

module load bioinfo-tools
module load quast/5.0.2

/sw/bioinfo/quast/5.0.2/snowy/bin/quast.py \
/home/ellens/Durian_fruit/Analyses/08_Correct_assembly_DNA/corrected_assembly.fasta \
--threads 2 -o /home/ellens/Durian_fruit/Analyses/09_Assembly_Evaluation_DNA/
