#Loading the DESeq2 library
library(DESeq2)

#Read in read count files
SRR6040092 <- read.delim('/Users/ellensiggstedt/Desktop/Genomanalys/GAProjekt/Read_counts/SRR6040092_counted', header=FALSE);
colnames(SRR6040092)=c('gene', 'SRR6040092');
SRR6040093 <- read.delim('/Users/ellensiggstedt/Desktop/Genomanalys/GAProjekt/Read_counts/SRR6040093_counted', header=FALSE);
colnames(SRR6040093)=c('gene', 'SRR6040093');
SRR6040094 <- read.delim('/Users/ellensiggstedt/Desktop/Genomanalys/GAProjekt/Read_counts/SRR6040094_counted', header=FALSE);
colnames(SRR6040094)=c('gene', 'SRR6040094');
SRR6040096 <- read.delim('/Users/ellensiggstedt/Desktop/Genomanalys/GAProjekt/Read_counts/SRR6040096_counted', header=FALSE);
colnames(SRR6040096)=c('gene', 'SRR6040096');
SRR6040097 <- read.delim('/Users/ellensiggstedt/Desktop/Genomanalys/GAProjekt/Read_counts/SRR6040097_counted', header=FALSE);
colnames(SRR6040097)=c('gene', 'SRR6040097');
SRR6156066 <- read.delim('/Users/ellensiggstedt/Desktop/Genomanalys/GAProjekt/Read_counts/SRR6156066_counted', header=FALSE);
colnames(SRR6156066)=c('gene', 'SRR6156066');
SRR6156067 <- read.delim('/Users/ellensiggstedt/Desktop/Genomanalys/GAProjekt/Read_counts/SRR6156067_counted', header=FALSE);
colnames(SRR6156067)=c('gene', 'SRR6156067');
SRR6156069 <- read.delim('/Users/ellensiggstedt/Desktop/Genomanalys/GAProjekt/Read_counts/SRR6156069_counted', header=FALSE);
colnames(SRR6156069)=c('gene', 'SRR6156069');
SRR6040095_P <- read.delim('/Users/ellensiggstedt/Desktop/Genomanalys/GAProjekt/Read_counts/trimmed_P_counted', header=FALSE);
colnames(SRR6040095_P)=c('gene', 'SRR6040095_P');
SRR6040095_U <- read.delim('/Users/ellensiggstedt/Desktop/Genomanalys/GAProjekt/Read_counts/trimmed_U_counted', header=FALSE);
colnames(SRR6040095_U)=c('gene', 'SRR6040095_U');

#Merging count read data into one matrix
table <- merge(merge(merge(merge(merge(merge(merge(merge(merge(SRR6040092, SRR6040093, by="gene", all.x=TRUE, all.y=TRUE), SRR6040094, by="gene", all.x=TRUE, all.y=TRUE), SRR6040096, by="gene", all.x=TRUE, all.y=TRUE), SRR6040097,by="gene", all.x=TRUE, all.y=TRUE), SRR6156066, by="gene", all.x=TRUE, all.y=TRUE), SRR6156067, by="gene", all.x=TRUE, all.y=TRUE), SRR6156069, by="gene", all.x=TRUE, all.y=TRUE), SRR6040095_P, by="gene", all.x=TRUE, all.y=TRUE), SRR6040095_U, by="gene", all.x=TRUE, all.y=TRUE)  

#Converting to a deseq friendly format
gene_names <- table$gene
sample_index <- grepl("SRR\\d+", colnames(table))
matrix_deseq <- as.matrix(table[,sample_index])
rownames(matrix_deseq) <- gene_names

#Creating matrix with tissue type
SRR <- c('SRR6040092', 'SRR6040093', 'SRR6040094', 'SRR6040096', 'SRR6040097', 'SRR6156066', 'SRR6156067', 'SRR6156069', 'SRR6040095_P', 'SRR6040095_U');
tis_type <- c('leaf', 'root', 'aril', 'stem', 'aril', 'aril_mon', 'aril_mon', 'aril_mon', 'aril', 'aril');
tissues <- data.frame(tis_type);

#Converting to a DESeq2 friendly format
rownames(tissues) <- c(SRR)
deseq2_data <- DESeqDataSetFromMatrix(countData=matrix_deseq, colData=tissues, design= ~ tis_type)
as.data.frame(colData(deseq2_data))
dds <- DESeq(deseq2_data)
res <- results(dds)

rld <- rlog(dds)
sampleDists <-dist(t(assay(rld)))
sampleDistMatrix <- as.matrix(sampleDists)
rownames(sampleDistMatrix)<-paste(rld$tis_type, sep="-")
colnames(sampleDistMatrix)<-NULL

#PCA
ramp <- 1:4/4
print(plotPCA(rld, intgroup=c("tis_type")))

#Heat map with gene clustering
library("genefilter")
topVarGenes <- head(order(rowVars(assay(rld)), decreasing=TRUE), 35)
heatmap.2(assay(rld)[topVarGenes, ], scale="row", trace="none", dendogram="column", col=colorRampPalette(rev(brewer.pal(9, "RdBu")))(255))
