library(MASS)
library(e1071)

source("example.R")

lda.model <- lda(Species ~., iris.train)
qda.model <- qda(Species ~., iris.train)
svm.model <- svm(Species ~., iris.train)

print("LDA:")
print(mean(predict(lda.model, newdata=iris.test)$class != iris.test$Species))
print("QDA:")
print(mean(predict(qda.model, newdata=iris.test)$class != iris.test$Species))
print("SVM:")
print(mean(predict(svm.model, newdata=iris.test) != iris.test$Species))
