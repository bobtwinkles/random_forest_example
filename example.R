library(rpart)
data(iris)

set.seed(0)

iris.subset <- function(m, n) {
  s1 <- sample(1:m, n)
  s2 <- sample((m+1):(2*m), n)
  s3 <- sample((2*m+1):(3*m), n)
  return(c(s1, s2, s3))
}

iris.i <- iris.subset(50, 30)
iris.train <- iris[iris.i,]
iris.test <- iris[-iris.i,]

forest <- list()
n.trees <- 100
for (i in 1:n.trees) {
  iris.s <- iris.subset(30, 25);
  iris.sd <- iris.train[iris.s,]
  forest[[i]] <- rpart(
    Species ~ .,
    data=iris.sd)
}

pred <- predict(forest[[1]],
                iris.test)
for (i in 2:n.trees) {
  pred <- pred + predict(
    forest[[i]], iris.test)
}
pred <- colnames(pred)[
  apply(pred, 1, which.max)
]
