library(rpart)
library(MASS)
library(e1071)
library(randomForest)
library(microbenchmark)

data(iris)

set.seed(0)

iris.subset <- function(m, n, r=F) {
  return(c(
    sample(1:m, n, replace=r),
    sample((m+1):(2*m), n, replace=r),
    sample((2*m+1):(3*m), n, replace=r)
  ))
}

iris.i <- iris.subset(50, 30)
iris.train <- iris[iris.i,]
iris.test <- iris[-iris.i,]

lda.model <- lda(Species ~., iris.train)
qda.model <- qda(Species ~., iris.train)
svm.model <- svm(Species ~., iris.train)
tree.model <- rpart(Species ~., iris.train)
forest.model <- randomForest(Species ~., iris.train)

benchmark.train <- microbenchmark(
  lda(Species ~., iris.train),
  qda(Species ~., iris.train),
  svm(Species ~., iris.train),
  rpart(Species ~., iris.train),
  randomForest(Species ~., iris.train),
  times=100
)

benchmark.predict <- microbenchmark(
  predict(lda.model, newdata=iris.test),
  predict(qda.model, newdata=iris.test),
  predict(svm.model, newdata=iris.test),
  predict(tree.model, newdata=iris.test),
  predict(forest.model, newdata=iris.test),
  times=100
)

cmd.args <- commandArgs(trailingOnly=T)
save(benchmark.train, benchmark.predict, file=cmd.args[1])
