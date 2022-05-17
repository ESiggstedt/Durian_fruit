# Durian fruit analysis

These analyses investigate what genes are differently expressed in different tissues of the Durian zibethinus Musang King fruit which is interesting to get familiar with the reason to the odour of the fruit. The analysis softwares used to do this can be seen below with a description of what each software does in the analysis. Data used for this is PacBio and Illumina reads from DNA, and Illumina reads from transcriptomes of different parts of the fruit (stalk, aril, leaf and root).

## FastQC
FastQC is used to check the quality of all the sequencing reads from a selected scaffold that are used for the analysis. It's also used after the trimming which can be seen below. The command for doing this is:

```Loading modules:
module load bioinfo-tools FastQC
fastqc -t 2 -q -o PATH_TO_OUTPUT_FOLDER/OUTPUT_FILE_NAME
```

when standing in the folder where the reads are.

## MultiQC
_Collect_qualitycontrols.sh_
MultiQC is used to collect the result from each type of quality control into a more overviewable format.

## Trimmomatic
_Trimming_Transcriptome.sh_
Trimmomatic is used for trimming untrimmed Illumina reads, for example removing adapters. Therefore the reads are the input.

## Canu
_Genome_assembly_PacBio.sh_
Canu is used to do a genome assembly on the DNA reads from PacBio with a parameter that specifies the genome size.

## BWA
_Mapping_Illumina_PacBio.sh_
BWA is used for mapping the Illumina DNA reads to the assembly of the PacBio. To do this an index is first created for the assembly file.

## Pilon
_Correct_assembly_DNA.sh_
Pilon is used to correct the genome assembly from Canu, this is performed with the mapping from BWA as input. The purpose of this step is to increase the quality of the assembly by using both Illumina and PacBio reads.

## Quast
_Assembly_evaluation_DNA.sh_
Quast is used to evaluate how good the assembly is.

## RepeatMasker
_Remove_repeats_DNA.sh_
RepeatMasker is used to remove repeats in the corrected assembly from Pilon. Here a flag is used to specify which specie is analysed.

## Star
_Mapping_DNA_transcriptome.sh_
Star is used one time for each of the transcriptome reads to map them to the data from RepeatMasker. The result from RepeatMasker is first used to create an index which is used as input to star.

## Braker
_Structural_annotation.sh_
Braker is used to do a structural annotation. A flag is used to specify which species the analysis is performed for. The result from RepeatMasker and Star were used. The following commands were run before the script were run.

```
module load bioinfo-tools
module load braker/2.1.1_Perl5.24.1
module load augustus/3.2.3_Perl5.24.1
module load bamtools/2.5.1
module load blast/2.9.0+
module load GenomeThreader/1.7.0
module load samtools/1.8
module load GeneMark/4.33-es_Perl5.24.1
```

When standing in the folder STRUCTURAL_ANNOTATON_OUTPUT this command were run:

```source $AUGUSTUS_CONFIG_COPY
chmod a+w -R /home/.../STRUCTURAL_ANNOTATON_OUTPUT/augustus_config/species/
cp -vf /sw/bioinfo/GeneMark/4.33-es/snowy/gm_key $HOME/.gm_key
```

## EggNOGmapper
_Functional_analysis.sh_
EggNOGmapper is used to do a functional annotation. The result from RepeatMasker is used as input.

## HTSeq
_Sort_BAM_files.sh_
_Read_counting.sh_
First the resulting BAM files from star is sorted with the script Sort_BAM_files.sh. Then HTSeq is run with the script Read_counting.sh to, for each file from star, count the number of mapped reads to genomic features.

## DeSeq2
_DeSeq2_
DeSeq2 is used to do a differential expression analysis by creating a heat map and a PCA. DeSeq2 is a package which can be dowloaded in RStudio with this command:

```
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("DESeq2")
```


