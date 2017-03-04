#!/usr/bin/env Rscript
library("optparse")

source("PhenoGraphFunc.R")
source("PhenoGraph.R")

runmode <- "alphas"
branchcandidate <- NaN


# Options
option_list = list(
  make_option(c("-w", "--gwasfile"), type="character", default=NULL, help="GWAS input file name"),
  make_option(c("-e", "--neutfile"), type="character", default=NULL, help="Neutral input file name"),
  make_option(c("-r", "--graphfile"), type="character", default=NULL, help="Graph R file name"),
  make_option(c("-o", "--outfile"), type="character", default="MCMC_trace.txt", help="MCMC trace output file name"),
  make_option(c("-q", "--qfile"), type="character", default="qfile.txt", help="Q_B statistic output file name"),
  make_option(c("-n", "--numsteps"), type="numeric", default=1000000, help="Total number of steps in MCMC"),
  make_option(c("-x", "--numsample"), type="numeric", default=1000, help="Sample (print) every X steps from the MCMC run"),
  make_option(c("-i", "--innerpropo"), type="numeric", default=0.01, help="Size of proposals for frequencies of inner nodes"),
  make_option(c("-s", "--alphastdev"), type="numeric", default=0.1, help="Standard deviation for alpha prior"),
  make_option(c("-t", "--alphapropo"), type="numeric", default=0.02, help="Size of proposals for alpha parameters"),
  make_option(c("-u", "--ssfactor"), type="numeric", default=25, help="Spike and slab factor")
); 
 
opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser);

if (is.null(opt$gwasfile)){
  print_help(opt_parser)
  stop("GWAS file name must be supplied.n", call.=FALSE)
}
if (is.null(opt$neutfile)){
  print_help(opt_parser)
  stop("Neutral file name must be supplied.n", call.=FALSE)
}
if (is.null(opt$graphfile)){
  print_help(opt_parser)
  stop("Graph file name must be supplied.n", call.=FALSE)
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


