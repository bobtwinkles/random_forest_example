cmd.args <- commandArgs(trailingOnly=T)
load(cmd.args[1])

png(file=cmd.args[2], width=5, height=6, units="in", res=300)
plot(benchmark.train)
title(main="Benchamark results for training")
dev.off()
