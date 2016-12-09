library(ggplot2)

data <- data.frame(method=c(
  "Random Forests",
  "Decision Tree",
  "SVM",
  "LDA",
  "QDA"
), rate=c(
  0.06666667,
  0.1,
  0.06666667,
  0.01666667,
  0.01666667
))

cmd.args <- commandArgs(trailingOnly=T)
fname <- cmd.args[1]
png(filename=fname, width=10,height=6,units="in", res=300)

ggplot(data, aes(x=method, y=rate)) +
  geom_bar(stat="identity") +
  theme(axis.text=element_text(size=16)) +
  theme(axis.title=element_text(size=16))
