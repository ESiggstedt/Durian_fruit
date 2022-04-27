#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:10:00
#SBATCH -J Collect_qualitycontrols
#SBATCH -o Collect_qualitycontrols.output
#SBATCH --mail-type=ALL
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se

module load bioinfo-tools
module load MultiQC/1.12

multiqc --filename MultiQC_illumina \
-o /home/ellens/Durian_fruit/Analyses/01_qualitycontrol_illumina/ \
/home/ellens/Durian_fruit/Analyses/01_qualitycontrol_illumina/*10*

multiqc	--filename MultiQC_pacbio \
-o /home/ellens/Durian_fruit/Analyses/02_qualitycontrol_pacbio/ \
/home/ellens/Durian_fruit/Analyses/02_qualitycontrol_pacbio/*10*

multiqc	--filename MultiQC_transcriptome_untrimmed \
-o /home/ellens/Durian_fruit/Analyses/03_qualitycontrol_transcriptome/ \
/home/ellens/Durian_fruit/Analyses/03_qualitycontrol_transcriptome/*10*

multiqc --filename MultiQC_transcriptome_trimmed \
-o /home/ellens/Durian_fruit/Analyses/06_qualitycontrol_trimmed_transcriptome \
/home/ellens/Durian_fruit/Analyses/06_qualitycontrol_trimmed_transcriptome/*10*
