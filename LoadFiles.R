# Plot graph
#plot(supergraph[[1]], show_inner_node_labels = TRUE, show_admixture_labels = TRUE)


if(exists("gwasfile")){
  
  # Load GWAS data  
  filename <- gwasfile
  data <- LoadCounts(filename, leaves)
  leaves_counts <- as.data.frame(data[,seq(5,dim(data)[2])])
  leaves_freqs <- ObtainFreqs(leaves_counts)
  effects <- as.numeric(data[,4])
  
  # Load Neutral data
  neutfilename <- neutfile
  neutdata <- LoadCounts(neutfilename, leaves)
  neut_leaves_counts <- as.data.frame(neutdata[,seq(5,dim(neutdata)[2])])
  neut_leaves_freqs <- ObtainFreqs(neut_leaves_counts)
  
  # Calculate chi-squared statistics
  stats <- ChiSquared(supergraph,leaves_freqs,effects,neut_leaves_freqs,total=FALSE)
  qtab <- cbind(rownames(stats),round(stats[,1],3),round(stats[,2],3),stats[,3])
  colnames(qtab) <- c("branch","Q_B","q_B","Pval")
  totalstat <- ChiSquared(supergraph,leaves_freqs,effects,neut_leaves_freqs,total=TRUE)
  qtab <- rbind(qtab, cbind("Total",round(totalstat[1],3),round(totalstat[2],3),totalstat[3]))
  
  write.table(qtab,file=qfile,quote=FALSE,col.names=TRUE,row.names=FALSE)
  
}