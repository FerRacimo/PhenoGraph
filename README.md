# PhenoGraph

To run, PhenoGraph requires:
- a GWAS input file
- a neutral input file
- a graph parameter file

# GWAS input file format

The GWAS input file format for PhenoGraph is a text file with 4+ columns. GWAS_HEIGHT_1000genomes_allpops.txt is an example input file. The first 3 columns correspond to the chromosome name, physical position and SNP id of each SNP that has been associated with a particular trait. The fourth column contains the effect size for the derived allele of that SNP. The effect size can be computed . It is important that the sign of the effect size is polarized with respect to the derived allele (rather than the minor or alternative allele, as may be traditionally done in some GWAS). Finally the fifth columns and all columns after that one contain the number of ancestral and derived alleles in each population that is a leaf in our graph (in the format "[number of ancestral alleles],[number of derived alleles]").


# Configuring a graph parameter file

SimpleGraph.R is an example graph parameter file.
