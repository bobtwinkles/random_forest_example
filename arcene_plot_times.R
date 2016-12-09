library(ggplot2)
cmd.args <- commandArgs(trailingOnly=T)

load(cmd.args[1])
d <- data.frame(algo=c("LDA", "SVM", "Tree", "Forest"),
                time=c(lda.time, svm.time, tree.time, forest.time))

png(filename=cmd.args[2], width=10,height=6,units="in", res=300)
ggplot(d) + geom_bar(aes(x=algo, y=time), stat='identity') + theme_bw()
