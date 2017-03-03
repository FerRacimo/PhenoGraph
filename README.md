# PhenoGraph

To run, PhenoGraph requires:
- a GWAS input file
- a neutral input file
- a graph parameter file

# GWAS input file format

The GWAS input file format for PhenoGraph is a text file with 4+ columns. GWAS_HEIGHT_1000genomes_allpops.txt is an example input file. The first 3 columns correspond to the chromosome name, physical position and SNP id of each SNP that has been associated with a particular trait. The fourth column contains the estimated effect size for the derived allele of that SNP. The estimated effect size can be computed as z * sqrt(v), where z is the signed z-score and v is the variance of the effect size, both of which can be obtained from a standard GWAS summary statistic file. It is important that the sign of the effect size is polarized with respect to the derived allele (rather than the minor or alternative allele, as may be traditionally done in some GWAS), so knowlege of the ancestral (chimpanzee-like) allele is required. Finally the fifth columns and all columns after that one contain the number of ancestral and derived alleles in each population that is a leaf in our graph (in the format "[number of ancestral alleles],[number of derived alleles]"). All the leaf populations specificed in the graph parameter file should be included as columns in this file (in any order), with the same column name as their corresponding name in the parameter file. It is ok to include additional populations that are not specified in the parameter file (the program will just ignore these).


# Configuring a graph parameter file

SimpleGraph.R is an example graph parameter file.
