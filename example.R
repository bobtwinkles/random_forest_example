library(rpart)
data(iris)

set.seed(0)

iris.subset <- function(m, n, r=F) {
  return(c(sapply(0:2,
    function(x) sample(
      ((x*m)+1):((x+1)*m), n,
      replace=r))))
}

iris.i <- iris.subset(50, 30)
iris.train <- iris[iris.i,]
iris.test <- iris[-iris.i,]

forest <- list()
n.trees <- 300
for (i in 1:n.trees) {
  iris.s <- iris.subset(30, 30, T);
  iris.f <- c(sample(1:4, 3), 5)
  iris.sd <- iris.train[iris.s,iris.f]
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

pred.one <- predict(rpart(Species ~., iris.train), iris.test, "class")
