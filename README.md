# PhenoGraph

# Required Libraries

PhenoGraph requires the following R libraries:
- opt-parse
- admixturegraph
- msm
- reshape2
- pscl
- vioplot
- parallel


# Input files

To run, PhenoGraph 3 input files:
- a GWAS input file
- a neutral input file
- a graph parameter file

# GWAS input file format

The GWAS input file should contain the SNPs that are known to be significantly associated with a particular trait. This file should contain 4+ columns. GWAS_HEIGHT_1000genomes_allpops.txt is an example GWAS input file. The first 3 columns correspond to the chromosome name, physical position and SNP id of each SNP that has been associated with a particular trait.

The fourth column contains the estimated effect size for the derived allele of that SNP. The estimated effect size can be computed as z * sqrt(v), where z is the signed z-score and v is the variance of the effect size, both of which can be obtained from a standard GWAS summary statistic file. It is important that the sign of the effect size is polarized with respect to the derived allele (rather than the minor or alternative allele, as may be traditionally done in some GWAS), so knowlege of the ancestral allele is required.

Finally the fifth columns and all columns after that one contain the number of ancestral and derived alleles in each population that is a leaf in our graph (in the format "[number of ancestral alleles],[number of derived alleles]"). All the leaf populations specificed in the graph parameter file should be included as columns in this file (in any order), with the same column name as their corresponding name in the parameter file. It is ok to include additional populations that are not specified in the parameter file (the program will just ignore these).

# Neutral input file format

The neutral input file should contain unlinked neutral SNPs that are not significantly associated with the trait in question, as this file will be used to compute the neutral population covariance matrix. This file has the same format as the GWAS file, except that the effect size column has no relevance and can be filled with any symbol. Neut_HEIGHT_1000genomes_allpops.txt is an example neutral input file (it is available in this repository but must be unzipped first).

# Graph parameter file

This file contains information about the admixture graph, which should have been previously inferred using a program like MixMapper (Lipson et al. 2013) or qpGraph (Patterson et al. 2012). SimpleGraph.R is an example graph parameter file. This file uses the R library admixturegraph (Leppälä et al. 2017) to build the graph.

# Running PhenoGraph

# Output files

PhenoGraph should produce two output files:
- The list of Q_B statistics for each branch in the graph
- The trace from the MCMC run


