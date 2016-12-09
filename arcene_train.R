library(rpart)
library(MASS)
library(e1071)
library(randomForest)
library(microbenchmark)

data(arcene)

set.seed(0)

print("Training LDA model")
start.time <- proc.time()
lda.model <- lda(label ~., arcene.train)
lda.time <- proc.time() - start.time

# qda.model <- qda(label ~., arcene.train)
# qda.time <- proc.time() - start.time

print("Training SVM model")
start.time <- proc.time()
svm.model <- svm(label ~., arcene.train)
svm.time <- proc.time() - start.time

print("Training tree model")
start.time <- proc.time()
tree.model <- rpart(label ~., arcene.train)
tree.time <- proc.time() - start.time

print("Training forest model")
start.time <- proc.time()
forest.model <- randomForest(label ~., arcene.train)
forest.time <- proc.time() - start.time

cmd.args <- commandArgs(trailingOnly=T)
save(
  lda.time, svm.time, tree.time, forest.time,
  lda.model, svm.model, tree.model, forest.model,
  file=cmd.args[1]
)
