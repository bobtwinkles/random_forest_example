library(ggplot2)
data(iris)
cmd.args <- commandArgs(trailingOnly=T)
fname <- cmd.args[1]
par(mfrow=c(2,2))
png(filename=fname, width=6,height=6,units="in", res=300)
for (width in c("Sepal.Width", "Petal.Width")) {
  for (length in c("Sepal.Length", "Petal.Length")) {
    ggplot(iris, aes_string(x=width, y=length, color="Species")) +
      geom_point()
  }
}
dev.off()
