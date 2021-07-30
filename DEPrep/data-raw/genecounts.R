setwd("C:\\Users\\40266190\\OneDrive - Queen's University Belfast\\PhD\\R_Packages\\DiffPrepare\\data-raw")
genecounts <- as.data.frame(matrix(ncol=3, nrow=10))
for(i in 1:10) {
  genecounts[i,] = sample((seq(from=0,to=500,by=.1)), size=3)
}

genecounts$gene_names <-c("gene1","gene2","gene3","gene4","gene5","gene6","gene7","gene8","gene9","gene10")
genecounts <-genecounts[,c("gene_names",'V1','V2','V3')]
colnames(genecounts)<-c("gene_names","treatment1","treatment2","treatment3")

usethis::use_data(genecounts, overwrite = TRUE)


