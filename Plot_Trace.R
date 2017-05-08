#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

source("PhenoGraphFunc.R")

file <- args[1]
phenoname <- args[2]
graphscript <- args[3]
output_boxplot <- args[4]
output_phenograph <- args[5]

minsel <- -0.3
maxsel <- 0.3

# Load admixture graph
source(graphscript)

# Load table
table <- read.table(file,header=TRUE)

# Remove burn-in
trace <- table[seq(10,dim(table)[1]-1,1),]

# Obtain alpha parameters
alphacols <- grep("alpha_",colnames(trace))

# Make pheno-graph
pdf(output_phenograph,width = 8, height = 8)
MakeGraphPlot(file,edgevalues,"r",phenoname,minsel,maxsel)
dev.off()
  
# Make boxplot
SNPs <- max(sapply(colnames(table),function(x){as.numeric(paste(unlist(strsplit(gsub("[^0-9]", "", x),"")),collapse=""))}),na.rm=TRUE)
titleboxplot <- paste("Posterior distributions of alpha parameters: ",phenoname," (num. SNPs: ",SNPs,")",sep="")
pdf(output_boxplot,width=15,height=5)
finalboxplot <- AlphaBoxPlot(trace,titleboxplot,FALSE,0)
grid.arrange(finalboxplot,ncol=1,nrow=1)
dev.off()
  