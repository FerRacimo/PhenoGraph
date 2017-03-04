#!/usr/bin/env Rscript
library("optparse")

source("PhenoGraphFunc.R")
source("PhenoGraph.R")

runmode <- "alphas"
branchcandidate <- NaN


# Options
option_list = list(
  make_option(c("-g", "--gwasfile"), type="character", default=NULL, help="GWAS input file name", metavar="character"),
  make_option(c("-e", "--neutfile"), type="character", default=NULL, help="Neutral input file name", metavar="character"),
  make_option(c("-r", "--graphfile"), type="character", default=NULL, help="Graph R file name", metavar="character"),
  make_option(c("-o", "--outfile"), type="character", default=NULL, help="MCMC trace output file name", metavar="character"),
  make_option(c("-q", "--qfile"), type="character", default=NULL, help="Q_B statistic output file name", metavar="character"),
  make_option(c("-n", "--numsteps"), type="numeric", default=1000000, help="Total number of steps in MCMC", metavar="numeric"),
  make_option(c("-x", "--numsample"), type="numeric", default=1000, help="Sample (print) every X steps from the MCMC run", metavar="numeric"),
  make_option(c("-i", "--innerpropo"), type="numeric", default=0.01, help="Size of proposals for frequencies of inner nodes", metavar="numeric"),
  make_option(c("-s", "--alphastdev"), type="numeric", default=0.1, help="Standard deviation for alpha prior", metavar="numeric"),
  make_option(c("-t", "--alphapropo"), type="numeric", default=0.02, help="Size of proposals for alpha parameters", metavar="numeric"),
  make_option(c("-u", "--ssfactor"), type="numeric", default=25, help="Spike and slab factor", metavar="numeric"),
); 
 
opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser);

if (is.null(opt$file)){
  print_help(opt_parser)
  stop("At least one argument must be supplied (input file).n", call.=FALSE)
}


gwasfile <- opt$gwasfile
neutfile <- opt$neutfile
graphfile <- opt$graphfile
outfile <- opt$outfile
qfile <- opt$qfile
numsteps <- opt$numsteps
numsample <- opt$numsample
innerfreqs_proposize <- opt$innerpropo
alpha_prior_stdev <- opt$alphastdev
alpha_proposize <- opt$alphapropo
ssfactor <- opt$ssfactor


# Load graph file
source(graphfile)

# Run PhenoGraph MCMC
test <- PhenoGraph(outfile,leaves_counts,neut_leaves_counts,effects,runmode,NaN,numsteps,numsample,innerfreqs_proposize,alpha_prior_stdev,alpha_proposize,ssfactor)


